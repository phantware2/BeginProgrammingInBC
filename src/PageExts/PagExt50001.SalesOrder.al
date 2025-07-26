pageextension 50001 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("No. of SO Lines"; Rec."No. of SO Lines")
            {
                ApplicationArea = All;
                ToolTip = 'The number of sales order lines for this sales order.';
            }
            field("Total Unit Price"; Rec."Total Unit Price")
            {
                ApplicationArea = All;
                ToolTip = 'The total unit price of all sales order lines for this sales order.';
            }
        }
    }
}