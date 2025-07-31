report 50003 "Update Sales Line"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "No.";
            DataItemTableView = sorting("Document Type", "No.") where(Status = const(Open));

            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

                trigger OnAfterGetRecord()
                begin
                    "Marked Line" := true;
                    Modify();
                end;

                trigger OnPostDataItem()
                begin
                    Message('Process completed successfully for Sales Line %1', "Sales Line"."No.");
                end;

            }
        }
    }
}