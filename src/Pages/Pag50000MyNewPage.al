page 50000 "My New Page"
{
    Caption = 'My New Page';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "My New Table";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field(ItemNo; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(CreatedAt; Rec."Created At")
                {
                    ApplicationArea = All;
                }
                field(ChangedAt; Rec."Changed At")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}