table 50001 Car
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Car; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Blocked';
        }
    }

    keys
    {
        key(PK; Car)
        {
            Clustered = true;
        }
    }
}