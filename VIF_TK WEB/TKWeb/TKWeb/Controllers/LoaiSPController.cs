﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TKWeb.Models;

namespace TKWeb.Controllers
{
    public class LoaiSPController : Controller
    {
        // GET: LoaiSP
        LoaiSPModel dblsp = new LoaiSPModel();
        public ActionResult Index()
        {
            return View();
        }
    }
}