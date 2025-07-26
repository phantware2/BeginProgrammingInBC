tableextension 50000 CustomerExt extends Customer
{
    fields
    {
        field(50000; Car; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Car';
            TableRelation = Car.Car;
        }
    }
}