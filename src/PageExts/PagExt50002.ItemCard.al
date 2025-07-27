pageextension 50002 ItemCardExt extends "Item Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter(CalculateCountingPeriod)
        {
            action(NewAction)
            {
                ApplicationArea = All;
                Caption = 'My New Action';
                Image = NewProperties;

                trigger OnAction()
                begin
                    Message('Hello from custom action');
                end;
            }
        }
    }

    var
        myInt: Integer;
}