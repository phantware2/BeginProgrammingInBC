tableextension 50000 CustomerExt extends Customer
{
    fields
    {
        field(50000; Car; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Car';
            TableRelation = Car.Car;
        }
    }


    // I will define an internal procedure that will help my new query, it will retrieve the data filtered by the customer number.I am setting this procedure as internal, since I want to be able to run it from outside this object.
    internal procedure GetSalesOrderAmount()
    var
        CustSalesOrder: Query "CustSalesOrder";
    begin
        // I will set a filter on the customer number to make sure that I am retrieving the data corresponding to the current customer record.
        CustSalesOrder.SetRange(CustomerNo, Rec."No.");
        // Once the filter is set, I will then use the open method on the query variable to make sure that the  query runs in the background and that the data set is generated.

        CustSalesOrder.Open();

        While CustSalesOrder.Read() Do
            Message(StrSubstNo('The customer %1 %2 has a %3 total amount and a %4 average amount on sales orders.', CustSalesOrder.CustomerName, CustSalesOrder.CustomerName, CustSalesOrder.OrderAmount, CustSalesOrder.OrderAverageAmount));
    end;
}