table 50000 "My New Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if (xRec."Item No." <> '') and (Rec."Item No." = '') then Error('You cannot have an empty Item No. on this record');
            end;

            trigger OnLookup()
            var
                Item: Record Item;
            begin
                if Page.RunModal(0, item) = Action::LookupOK then Rec."Item No." := Item."No.";
            end;
        }
        field(4; "Created At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Changed At"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blocked';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        "Created At" := CurrentDateTime;
    end;

    trigger OnModify()
    begin
        "Changed At" := CurrentDateTime;
    end;

    trigger OnDelete()
    begin
        Message('The record %1 was deleted', Rec.Code);
    end;

    trigger OnRename()
    begin
        Message('Record was renamed. Old key is: %1, the new key is: %2', xRec.Code, Rec.Code);
    end;

}