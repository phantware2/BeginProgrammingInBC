report 50001 "Customer Cars"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CustomerCars.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Car; Car)
            {
                IncludeCaption = true;
            }
        }
    }
}