query 50000 CustSalesOrder
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.")
            {
            }
            column(CustomerName; Name)
            {
            }
            dataitem(SalesHeader; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                DataItemTableFilter = "Document Type" = const(Order);

                column(OrderAmount; Amount)
                {
                    // Setting the method property to sum some on this column will make sure to calculate the total amount that is found on all the orders corresponding to this customer.
                    Method = Sum;
                }
                column(OrderAverageAmount; Amount)
                {
                    //Setting the method property to average will make sure to calculate the average amount for this customer's sales orders.
                    Method = Average;
                }
            }
        }
    }
}