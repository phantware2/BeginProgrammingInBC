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
}