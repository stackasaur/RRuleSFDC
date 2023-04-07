@isTest
public class RRuleTest {
    static testmethod void testConstructors(){
        RRule rule = new RRule();

        RRule.Options options = new RRule.Options();
        options.freq = RRule.Frequency.DAILY;
        RRule second_rule = new RRule(options);

        Assert.areEqual(RRule.Frequency.DAILY,second_rule.getFrequency());
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

    static testmethod void testGetFrequencyString(){
        Assert.areEqual('YEARLY',RRule.getFrequencyString(RRule.Frequency.YEARLY));
        Assert.areEqual('MONTHLY',RRule.getFrequencyString(RRule.Frequency.MONTHLY));
        Assert.areEqual('WEEKLY',RRule.getFrequencyString(RRule.Frequency.WEEKLY));
        Assert.areEqual('DAILY',RRule.getFrequencyString(RRule.Frequency.DAILY));
        Assert.areEqual('HOURLY',RRule.getFrequencyString(RRule.Frequency.HOURLY));
        Assert.areEqual('MINUTELY',RRule.getFrequencyString(RRule.Frequency.MINUTELY));
        Assert.areEqual('SECONDLY',RRule.getFrequencyString(RRule.Frequency.SECONDLY));
        Assert.isNull(RRule.getFrequencyString(null));
    }
    static testmethod void testGetFrequencyEnum(){
        Assert.areEqual(RRule.Frequency.YEARLY,RRule.getFrequencyEnum('yearly'));
        Assert.areEqual(RRule.Frequency.MONTHLY,RRule.getFrequencyEnum('monthly'));
        Assert.areEqual(RRule.Frequency.WEEKLY,RRule.getFrequencyEnum('weekly'));
        Assert.areEqual(RRule.Frequency.DAILY,RRule.getFrequencyEnum('daily'));
        Assert.areEqual(RRule.Frequency.HOURLY,RRule.getFrequencyEnum('hourly'));
        Assert.areEqual(RRule.Frequency.MINUTELY,RRule.getFrequencyEnum('minutely'));
        Assert.areEqual(RRule.Frequency.SECONDLY,RRule.getFrequencyEnum('secondly'));
        Assert.isNull(RRule.getFrequencyEnum(null));
        Assert.isNull(RRule.getFrequencyEnum('foo'));
    }

    static testmethod void testGetWeekString(){
        Assert.areEqual('MO',RRule.getWeekString(RRule.Week.MON));
        Assert.areEqual('TU',RRule.getWeekString(RRule.Week.TUE));
        Assert.areEqual('WE',RRule.getWeekString(RRule.Week.WED));
        Assert.areEqual('TH',RRule.getWeekString(RRule.Week.THU));
        Assert.areEqual('FR',RRule.getWeekString(RRule.Week.FRI));
        Assert.areEqual('SA',RRule.getWeekString(RRule.Week.SAT));
        Assert.areEqual('SU',RRule.getWeekString(RRule.Week.SUN));
        Assert.isNull(RRule.getWeekString(null));
    }
    static testmethod void testGetWeekEnum(){
        Assert.areEqual(RRule.Week.MON,RRule.getWeekEnum('MO'));
        Assert.areEqual(RRule.Week.TUE,RRule.getWeekEnum('TU'));
        Assert.areEqual(RRule.Week.WED,RRule.getWeekEnum('WE'));
        Assert.areEqual(RRule.Week.THU,RRule.getWeekEnum('TH'));
        Assert.areEqual(RRule.Week.FRI,RRule.getWeekEnum('FR'));
        Assert.areEqual(RRule.Week.SAT,RRule.getWeekEnum('SA'));
        Assert.areEqual(RRule.Week.SUN,RRule.getWeekEnum('SU'));
        Assert.isNull(RRule.getWeekEnum(null));
        Assert.isNull(RRule.getWeekEnum('foo'));
    }

    static testmethod void testGetMonthInteger(){
        Assert.areEqual(1,RRule.getMonthInteger(RRule.Month.JAN));
        Assert.areEqual(2,RRule.getMonthInteger(RRule.Month.FEB));
        Assert.areEqual(3,RRule.getMonthInteger(RRule.Month.MAR));
        Assert.areEqual(4,RRule.getMonthInteger(RRule.Month.APR));
        Assert.areEqual(5,RRule.getMonthInteger(RRule.Month.MAY));
        Assert.areEqual(6,RRule.getMonthInteger(RRule.Month.JUN));
        Assert.areEqual(7,RRule.getMonthInteger(RRule.Month.JUL));
        Assert.areEqual(8,RRule.getMonthInteger(RRule.Month.AUG));
        Assert.areEqual(9,RRule.getMonthInteger(RRule.Month.SEP));
        Assert.areEqual(10,RRule.getMonthInteger(RRule.Month.OCT));
        Assert.areEqual(11,RRule.getMonthInteger(RRule.Month.NOV));
        Assert.areEqual(12,RRule.getMonthInteger(RRule.Month.DEC));
        Assert.isNull(RRule.getMonthInteger(null));
    }
    static testmethod void testGetMonthEnum(){
        Assert.areEqual(RRule.Month.JAN,RRule.getMonthEnum(1));
        Assert.areEqual(RRule.Month.FEB,RRule.getMonthEnum(2));
        Assert.areEqual(RRule.Month.MAR,RRule.getMonthEnum(3));
        Assert.areEqual(RRule.Month.APR,RRule.getMonthEnum(4));
        Assert.areEqual(RRule.Month.MAY,RRule.getMonthEnum(5));
        Assert.areEqual(RRule.Month.JUN,RRule.getMonthEnum(6));
        Assert.areEqual(RRule.Month.JUL,RRule.getMonthEnum(7));
        Assert.areEqual(RRule.Month.AUG,RRule.getMonthEnum(8));
        Assert.areEqual(RRule.Month.SEP,RRule.getMonthEnum(9));
        Assert.areEqual(RRule.Month.OCT,RRule.getMonthEnum(10));
        Assert.areEqual(RRule.Month.NOV,RRule.getMonthEnum(11));
        Assert.areEqual(RRule.Month.DEC,RRule.getMonthEnum(12));
        Assert.isNull(RRule.getMonthEnum(null));
        Assert.isNull(RRule.getMonthEnum(0));
    }

    static testmethod void testParseDate(){
        Datetime now = Datetime.now();
        String dt = now.formatGmt('yyyyMMdd\'T\'HHmmss\'Z\'');
        Datetime parsed = RRule.parseDate(dt);
        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - parsed.getTime());
    } 
    static testmethod void testParseDtStart(){
        Datetime now = Datetime.now();
        String dt = now.formatGmt('yyyyMMdd\'T\'HHmmss\'Z\'');

        String input = 'DTSTART:'+dt;
        RRule.Options options = RRule.parseDtStart(input);
        Assert.isNull(options.tzid);
        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - options.dtstart.getTime());


        String input_tz = 'DTSTART;TZID=America/New_York:'+dt;
        RRule.Options options_tz = RRule.parseDtStart(input_tz);
        Assert.areEqual('America/New_York',options_tz.tzid);
        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - options_tz.dtstart.getTime());
    } 
    static testmethod void testParseRRule(){
        Datetime now = Datetime.now();
        String dt = now.formatGmt('yyyyMMdd\'T\'HHmmss\'Z\'');

        String input = 'RRULE:FREQ=DAILY;COUNT=2;INTERVAL=1;WKST=MO;BYDAY=MO,TU,WE;BYMONTH=1,2,3;UNTIL='+dt;
        RRule.Options options = RRule.parseRRule(input);
        Assert.areEqual(RRule.Frequency.DAILY,options.freq);
        Assert.areEqual(2,options.count);
        Assert.areEqual(1,options.interval);
        Assert.areEqual(RRule.Week.MON,options.wkst);
        Assert.isTrue(options.byday.containsAll(new List<RRule.Week>{RRule.Week.MON,RRule.Week.TUE,RRule.Week.WED}));
        Assert.isTrue(options.bymonth.containsAll(new List<RRule.Month>{RRule.Month.JAN,RRule.Month.FEB,RRule.Month.MAR}));
        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - options.until.getTime());

        String input_dt = 'RRULE:FREQ=WEEKLY;COUNT=30;DTSTART='+dt;

        RRule.Options options_dt = RRule.parseRRule(input_dt);
        Assert.areEqual(30,options_dt.count);
        Assert.areEqual(RRule.Frequency.WEEKLY,options_dt.freq);
        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - options_dt.dtstart.getTime());

        // TEST ERR
        try{
            String input_bad = 'FOO=BAR';
            RRule.Options options_bad = RRule.parseRRule(input_bad);

            Assert.fail();
        }
        catch(RRule.RRuleException e){
            Assert.isTrue(true);
        }
        
    } 

    static testmethod void testFromString(){
        Datetime now = Datetime.now();
        String dt = now.formatGmt('yyyyMMdd\'T\'HHmmss\'Z\'');
        String rfcString = 'DTSTART:'+dt+'\nRRULE:FREQ=WEEKLY;COUNT=30;';

        RRule rule = RRule.fromString(rfcString);
        RRule.Options options = rule.options;

        Assert.areEqual(RRule.Frequency.WEEKLY,options.freq);
        Assert.areEqual(30,options.count);
        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - options.dtstart.getTime());
    }

    static testmethod void testParseLine_RRule(){
        String line = 'RRULE:FREQ=WEEKLY;COUNT=30;';
        RRule.Options options = RRule.parseLine(line);

        Assert.areEqual(RRule.Frequency.WEEKLY,options.freq);
        Assert.areEqual(30,options.count);
    }
    static testmethod void testParseLine_DtStart(){
        Datetime now = Datetime.now();
        String dt = now.formatGmt('yyyyMMdd\'T\'HHmmss\'Z\'');

        String line = 'DTSTART:'+dt;
        RRule.Options options = RRule.parseLine(line);

        Assert.areEqual(0,now.getTime() - now.millisecondGmt() - options.dtstart.getTime());
    }
    static testmethod void testParseLine_NoHead(){
        String line = 'FREQ=WEEKLY;COUNT=30;';
        RRule.Options options = RRule.parseLine(line);

        Assert.areEqual(RRule.Frequency.WEEKLY,options.freq);
        Assert.areEqual(30,options.count);
    }
    static testmethod void testParseLine_Blank(){
        String line = '   ';
        RRule.Options options = RRule.parseLine(line);

        Assert.isNull(options);
    }
    static testmethod void testParseLine_Bad(){
        String line = 'FOO:BAR';
        try{
            RRule.Options options = RRule.parseLine(line);
            Assert.fail();
        }catch(RRule.RRuleException e){
            Assert.isTrue(true);
        }
    }

    static testmethod void testOptions(){
        RRule.Options opts = new RRule.Options();
        Datetime now = Datetime.now();
        opts.dtstart = now;
        opts.until = now.addDays(1);
        opts.freq = RRule.Frequency.MONTHLY;
        opts.tzid = 'America/New_York';
        opts.wkst = RRule.Week.MON;
        opts.byday = new Set<RRule.Week>{RRule.Week.MON};
        opts.bymonth = new Set<RRule.Month>{RRule.Month.JAN};
        opts.count = 1;
        opts.interval = 1;

        // no assertion needed
    }
    static testmethod void testOptionsMerge(){
        Datetime now = Datetime.now();

        RRule.Options opts = new RRule.Options();

        RRule.Options opts2 = new RRule.Options();
        opts2.dtstart = now;

        opts.mergeOptions(opts2);

        Assert.areEqual(now,opts.dtstart);
    }
}