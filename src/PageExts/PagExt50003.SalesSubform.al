pageextension 50003 "Sales Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field(MarkedLine; Rec."Marked Line") { ApplicationArea = All; }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}