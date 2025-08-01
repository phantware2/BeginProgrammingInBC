pageextension 50000 CustomerCardExt extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field(Car; Rec.Car)
            {
                ApplicationArea = All;
                ToolTip = 'This is the customer''s car.';
            }
        }
    }
    actions
    {
        addafter("Report Statement")
        {
            action(CustomerCars)
            {
                ApplicationArea = All;
                Caption = 'Customer Cars';
                Image = Action;
                ToolTip = 'View the cars associated with this customer.';

                trigger OnAction()
                var
                    CustomerCarsReport: Report "Customer Cars";
                begin
                    CustomerCarsReport.Run();
                end;
            }
        }
        addfirst(processing)
        {
            action(GetAmountInfo)
            {
                ApplicationArea = All;
                Caption = 'Get Sales Order Amount Info';
                ToolTip = 'Retrieve the total and average sales order amounts for this customer.';
                Image = NewSum;

                trigger OnAction()
                begin
                    Rec.GetSalesOrderAmount();
                end;
            }
        }
    }
}