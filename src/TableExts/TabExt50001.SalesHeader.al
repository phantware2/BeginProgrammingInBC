tableextension 50001 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "No. of SO Lines"; Integer)
        {
            Caption = 'No. of SO Lines';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Sales Line" where("Document Type" = field("Document Type"), "Document No." = field("No.")));
        }
        field(50001; "Total Unit Price"; Decimal)
        {
            Caption = 'Total Unit Price';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Sales Line"."Unit Price" where("Document Type" = field("Document Type"), "Document No." = field("No.")));
        }
        field(50002; "Sales Line Exit"; Boolean)
        {
            Caption = 'Sales Line Exit';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Sales Line" where("Document Type" = field("Document Type"), "Document No." = field("No.")));
        }
        field(50003; "Contact Email"; Text[80])
        {
            Caption = 'Contact Email';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Contact."E-Mail" where("No." = field("Sell-to Contact No.")));
        }
        field(50004; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blocked';
        }
    }
}