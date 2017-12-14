﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FoodOrderSystem.Models;

namespace FoodOrderSystem.Controllers
{
    public class HomeController : Controller   
    {
        private FoodOrderDatabaseEntities _entities;

        public HomeController()
        {
            _entities = new FoodOrderDatabaseEntities();

            ViewBag.Categories = _entities.FoodCategory.ToArray();
        }


        public ActionResult Index()
        {
            return View("Index", _entities.Food.Include("FoodCategory"));
        }

        public ActionResult List(Int32 categoryId)
        {
           
            if (!_entities.FoodCategory.Any(c => c.Id == categoryId))
                return HttpNotFound(); 

            return View("Index", _entities.Food.Include("FoodCategory").Where(b => b.FoodCategoryId == categoryId));
        }
    }
}