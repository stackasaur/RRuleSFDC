@isTest
public class RRuleTest {
    static testmethod void testConstructor(){
        RRule rule = new RRule();
    }
    static testmethod void testGettersAndSetters(){
        RRule rule = new RRule();
        Assert.isNotNull(rule.options);

        Datetime now = Datetime.now();
        Datetime tomorrow = now.addDays(1);
        rule.setStart(now);
        Assert.areEqual(now,rule.getStart());

        rule.setWeekStart(RRule.Week.SUN);
        Assert.areEqual(RRule.Week.SUN,rule.getWeekStart());

        rule.setFrequency(RRule.Frequency.WEEKLY);
        Assert.areEqual(RRule.Frequency.WEEKLY,rule.getFrequency());

        rule.setInterval(1);
        Assert.areEqual(1,rule.getInterval());

        rule.setEnd(tomorrow);
        Assert.areEqual(tomorrow,rule.getEnd());

        rule.setCount(1);
        Assert.areEqual(1,rule.getCount());

        rule.setTimezone('America/New_York');
        Assert.areEqual('America/New_York',rule.getTimezone());

        rule.setByDay(RRule.Week.SUN);
        rule.setByDay(new Set<RRule.Week>{RRule.Week.MON});
        rule.addByDay(RRule.Week.TUE);
        Set<RRule.Week> byDay = rule.getByDay();
        Assert.areEqual(2,byDay.size());
        Assert.isTrue(byDay.contains(RRule.Week.MON) && byDay.contains(RRule.Week.TUE));

        rule.setByMonth(RRule.Month.JAN);
        rule.setByMonth(new Set<RRule.Month>{RRule.Month.FEB});
        rule.addByMonth(RRule.Month.MAR);
        Set<RRule.Month> byMonth = rule.getByMonth();
        Assert.areEqual(2,byMonth.size());
        Assert.isTrue(byMonth.contains(RRule.Month.FEB) && byMonth.contains(RRule.Month.MAR));
    }
}