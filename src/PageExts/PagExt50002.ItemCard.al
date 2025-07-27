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
        addfirst(navigation)
        {
            action(ItemSalesLine)
            {
                ApplicationArea = All;
                Caption = 'Item Sales Line';
                Image = AllLines;
                RunObject = Page "Sales Lines";
                RunPageLink = "No." = field("No."), Type = const(Item);
            }
        }
    }

    var
        myInt: Integer;
}