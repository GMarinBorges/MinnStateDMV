﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace MinnStateDMV.Models
{
    public partial class Driver
    {
        public Driver()
        {
            Infractions = new HashSet<Infraction>();
            Vehicles = new HashSet<Vehicle>();
        }

        public string DriverFirstName { get; set; }
        public string DriverLastName { get; set; }
        public DateTime? DriverBirthDate { get; set; }
        public int DriverSsn { get; set; }
        public string DriverPlateNumber { get; set; }
        public string DriverStreet { get; set; }
        public string DriverCity { get; set; }
        public string DriverState { get; set; }
        public int? DriverZip { get; set; }

        public virtual ICollection<Infraction> Infractions { get; set; }
        public virtual ICollection<Vehicle> Vehicles { get; set; }
    }
}