report 50000 "Report Trigger Example"
{
    Caption = 'Report Trigger Example';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "No.";


            dataitem(SalesLine; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");

                trigger OnPreDataItem()
                begin
                    SalesLine.SetRange(Type, SalesLine.Type::Item);
                    Message('OnPreDataItem for SalesLine that is executed before processing the Sales Line data item filtered by Item type');
                end;

                trigger OnAfterGetRecord()
                begin
                    SalesLineCount := SalesLineCount + 1;
                    Message('OnAfterGetRecord for SalesLine that is executed after processing each Sales Line record');
                end;
            }

            trigger OnPreDataItem()
            begin
                SalesHeader.SetRange(Status, SalesHeader.Status::Open);
                Message('OnPreDataItem for SalesHeader that is executed before processing the Sales Header data item filtered by Open status');
            end;

            trigger OnAfterGetRecord()
            begin
                SalesHeaderCount := SalesHeaderCount + 1;
                Message('OnAfterGetRecord for SalesHeader that is executed after processing each Sales Header record');
            end;
        }
    }

    trigger OnPreReport()
    begin
        Message('This report will count the sales header and corresponding sales line');
    end;

    trigger OnPostReport()
    var
        CountLbl: Label 'The report counted %1 header and %2 lines', Comment = '%1=SalesHeaderCount, %2=SalesLineCount';
    begin
        Message(StrSubstNo(CountLbl, SalesHeaderCount, SalesLineCount));
        Message('OnPostReport that is executed after the report has been processed');
    end;

    var
        SalesHeaderCount, SalesLineCount : Integer;
}