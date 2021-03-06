using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Localization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Fap.Core.Infrastructure.Domain;
using Fap.Core.DI;
using Microsoft.Extensions.FileProviders;
using System.IO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authentication.Cookies;
using Newtonsoft.Json;
using Fap.Hcm.Web.Models;
using Fap.AspNetCore.Infrastructure.Filter;
using UEditorNetCore;
using Microsoft.AspNetCore.HttpOverrides;
using Fap.Core.SignalR;
using Microsoft.Extensions.Options;

namespace Fap.Hcm.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddFapService().AddAutoInjection().AddDataTracker();
            //添加schedule后台任务
            services.AddHostedService<BackgroundSchedulerService>();

            //response 压缩giz
            services.AddResponseCompression();
            //添加内存缓存
            services.AddMemoryCache();
            services.AddSession();
            //UEditor
            services.AddUEditorService("ueditorconfig.json");
            //添加认证
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            }).AddCookie(options =>
            {
                options.Cookie.HttpOnly = true;
                options.ExpireTimeSpan = TimeSpan.FromHours(1);
                options.LoginPath = new PathString("/");
                options.LogoutPath = "/";
                //options.AccessDeniedPath = "";//指定路径处理 return Forbid() or ForbidAsync()
                options.Cookie = new CookieBuilder
                {
                    IsEssential = false // required for auth to work without explicit user consent; adjust to suit your privacy policy
                };
            });
            services.AddMiniProfiler(options =>
            {
                options.PopupRenderPosition = StackExchange.Profiling.RenderPosition.BottomRight;
                options.PopupShowTimeWithChildren = true;
                options.RouteBasePath = "/profiler";
            });
            services.AddControllersWithViews(options =>
            {
                options.Filters.Add<FapExceptionFilter>();
            }).AddNewtonsoftJson().AddRazorRuntimeCompilation();
            //IWebHostEnvironment env = services.BuildServiceProvider()
            //                                  .GetService<IWebHostEnvironment>();
            //if (env.IsProduction())
            //{
            //    //自动申请SSL
            //    services.AddLetsEncrypt();
            //}
            services.AddSignalR();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            //nginx反向代理header设置
            app.UseForwardedHeaders(new ForwardedHeadersOptions
            {
                ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto
            });
            // force the en-US culture, so that the app behaves the same even on machines with different default culture
            var supportedCultures = new[] { new CultureInfo("en-US") };
            //应用数据跟踪器呼应AddDataTracker();
            app.UseDataTracker();
            app.UseRequestLocalization(new RequestLocalizationOptions
            {
                DefaultRequestCulture = new RequestCulture("en-US"),
                SupportedCultures = supportedCultures,
                SupportedUICultures = supportedCultures
            });
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                //生成多语js文件
                app.BuilderMultiLanguageJsFile();
                //迷你性能监控
                app.UseMiniProfiler();
            }
            else
            {
                app.UseStatusCodePagesWithRedirects("~/Home/StatusCode?code={0}");
                //app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseResponseCompression();
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSession();
            //临时文件夹供下载使用
            app.UseStaticFiles(new StaticFileOptions()
            {
                ServeUnknownFileTypes = true,
                FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), $"{FapPlatformConstants.TemporaryFolder}")),
                RequestPath = new PathString($"/{FapPlatformConstants.TemporaryFolder}")
            });
            //模板（打印模板，报表模板）
            app.UseStaticFiles(new StaticFileOptions()
            {
                ServeUnknownFileTypes = true,
                FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory(), $"{FapPlatformConstants.Template}")),
                RequestPath = new PathString($"/{FapPlatformConstants.Template}")
            });
            app.UseRouting();           
            //认证
            app.UseAuthentication();
            //鉴权
            app.UseAuthorization();
            
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHub<OnlineUserHub>("/onlineHub");
                endpoints.MapControllerRoute(
                    name: "areaRoute",
                    pattern: "{area:exists}/{controller}/{action}/{fid?}",
                    defaults: new { action = "Index" });

                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{fid?}");
            });
        }
    }
}
