page 50001 Cars
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Car;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Car; Rec.Car)
                {
                    ApplicationArea = All;
                    ToolTip = 'The unique identifier for the car.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'A description of the car.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = 'Indicates whether the car is blocked.';
                }
            }
        }
    }
    views
    {
        view(ActiveCars)
        {
            Filters = where("Blocked" = const(false));
        }
        view(BlockedCars)
        {
            Filters = where("Blocked" = const(true));
        }
    }
}