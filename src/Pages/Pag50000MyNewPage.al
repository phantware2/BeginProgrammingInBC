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
                    Visible = IsVisible;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Message('OnOpenPage triggered for My New Page');
        IsVisible := false;
    end;

    trigger OnAfterGetRecord()

    /* Typical uses of this trigger are to modify field values before displaying them.
    Apply custom formatting.
    Perform some logic based on the record field values, or to refresh, for example, other page parts like fact boxes and so on. */

    begin
        Message('OnAfterGetRecord triggered for My New Page, record: %1', Rec.Code);
    end;

    trigger OnAfterGetCurrRecord()
    /* Next in line is the on after get current record trigger, which runs after the current record is retrieved. Basically after the on after get record.
    */
    begin
        Message('OnAfterGetCurrRecord triggered for My New Page, current record: %1', Rec.Code);
        if rec.Description = '' then
            Rec.Description := 'Sample Description';
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean

    /* The next trigger is on query close page, which runs before a page is closed through the return   value of this trigger, you can control if the page is closed or not.
    For example, I will add a confirmation message asking the user if he really wants to close the page. */

    begin
        if Confirm('Do you really want to close this page?') then
            exit(true)
        else
            exit(false);
    end;

    trigger OnClosePage()
    /* Then the last trigger I want to discuss is the on close page trigger, which is run right after on queryclose page trigger.
    Then the same as in the other cases. */
    begin
        Message('OnClosePage triggered for My New Page, page is closing');
    end;

    var
        IsVisible: Boolean;
}