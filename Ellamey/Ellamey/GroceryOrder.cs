//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Ellamey
{
    using System;
    using System.Collections.Generic;
    
    public partial class GroceryOrder
    {
        public GroceryOrder()
        {
            this.GroceryOrderItems = new HashSet<GroceryOrderItem>();
        }
    
        public int GroceryOrderId { get; set; }
        public int GrocerId { get; set; }
        public int OrderStatusId { get; set; }
        public string Total { get; set; }
        public int PaymentStatusId { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public int LoginId { get; set; }
        public string OrderDate { get; set; }
        public string TransactionId { get; set; }
        public string TrackingId { get; set; }
        public string BankRefNo { get; set; }
        public string OrderStatus { get; set; }
    
        public virtual Grocer Grocer { get; set; }
        public virtual OrderStatusGrocer OrderStatusGrocer { get; set; }
        public virtual PaymentStatu PaymentStatu { get; set; }
        public virtual ICollection<GroceryOrderItem> GroceryOrderItems { get; set; }
        public virtual Login Login { get; set; }
    }
}
