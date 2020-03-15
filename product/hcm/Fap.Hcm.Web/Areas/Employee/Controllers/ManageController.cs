﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Fap.AspNetCore.Infrastructure;
using Fap.Core.Infrastructure.Metadata;
using Fap.Hcm.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Fap.Core.Extensions;

namespace Fap.Hcm.Web.Areas.Employee.Controllers
{
    [Area("Employee")]
    public class ManageController : FapController
    {
        public ManageController(IServiceProvider serviceProvider) : base(serviceProvider)
        {
        }

        public IActionResult EmpIndex()
        {
            var model = this.GetJqGridModel("Employee");
            ViewBag.EmpCategory = _dbContext.Dictionarys("EmpCategory");
            ViewBag.EmpStatus = _dbContext.Dictionarys("EmpStatus");

            IEnumerable<FapTable> empChilds = _dbContext.Tables(t => t.TableCategory == "EmpSub");//||t.TableCategory=="EmpBiz");
            var gvms= empChilds.Select(t => new GridViewModel { TableLabel = t.TableComment, TableName = t.TableName, Condition = "EmpUid='" + _applicationContext.EmpUid + "'" });
            ViewBag.SubInfo =gvms.ToJson();
            return View(model);
        }
        public PartialViewResult EmpPartJob(string empUid,string empName,string empCode)
        {
            var model = GetJqGridModel("EmpPartJob", qs =>
            {
                qs.GlobalWhere = "EmpUid=@EmpUid";
                qs.AddParameter("EmpUid", empUid);
                qs.AddDefaultValue("EmpUid", empUid);
                qs.AddDefaultValue("EmpUidMC", empName);
                qs.AddDefaultValue("EmpCode", empCode);
            });
            return PartialView(model);
        }
        public IActionResult EmpHistory()
        {
            var model = this.GetJqGridModel("Employee");
            return View(model);
        }

    }
}