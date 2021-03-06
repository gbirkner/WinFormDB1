//------------------------------------------------------------------------------
// <auto-generated>
//     Der Code wurde von einer Vorlage generiert.
//
//     Manuelle Änderungen an dieser Datei führen möglicherweise zu unerwartetem Verhalten der Anwendung.
//     Manuelle Änderungen an dieser Datei werden überschrieben, wenn der Code neu generiert wird.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WinFormDB1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Invoice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Invoice()
        {
            this.InvoicePositions = new HashSet<InvoicePosition>();
        }
    
        public int InvoiceID { get; set; }
        public System.DateTime InvDate { get; set; }
        public int CustomerID { get; set; }
        public string IBAN { get; set; }
        public Nullable<int> DelAddressID { get; set; }
        public string DelAddressTypeID { get; set; }
        public Nullable<int> InvAddressID { get; set; }
        public string InvAddressTypeID { get; set; }
        public float Discount { get; set; }
        public bool Delivered { get; set; }
        public bool Paid { get; set; }
        public bool Cancelled { get; set; }
    
        public virtual CustomerAddress CustomerAddress { get; set; }
        public virtual CustomerAddress CustomerAddress1 { get; set; }
        public virtual Customer Customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InvoicePosition> InvoicePositions { get; set; }
    }
}
