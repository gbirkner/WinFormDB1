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
    
    public partial class CustomerAddress
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CustomerAddress()
        {
            this.Invoices = new HashSet<Invoice>();
            this.Invoices1 = new HashSet<Invoice>();
        }
    
        public int CustomerID { get; set; }
        public int AddressID { get; set; }
        public string AddressTypeID { get; set; }
        public int AddressTypeNr { get; set; }
    
        public virtual Address Address { get; set; }
        public virtual AddressType AddressType { get; set; }
        public virtual Customer Customer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices1 { get; set; }
    }
}
