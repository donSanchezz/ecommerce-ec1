using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECarRental.Model
{
    public class Vehicle
    {

        public Vehicle()
        {
        }

        public Vehicle(int id, string name, string description, int price, string category, string image)
        {
            Id = id;
            Name = name;
            Description = description;
            Price = price;
            Category = category;
            Image = image;
        }

        public int Id { get; set; }
        
        public String Name { get; set; }

        public String Description { get; set; }

        public int Price { get; set; }

        public String Category { get; set; }

        public String Image { get; set; }

    }
}