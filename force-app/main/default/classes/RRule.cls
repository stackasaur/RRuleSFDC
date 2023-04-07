public class RRule {
    public enum Frequency {YEARLY, MONTHLY, WEEKLY, DAILY, HOURLY, MINUTELY, SECONDLY}
    public enum Week {MON, TUE, WED, THU, FRI, SAT, SUN}
    public enum Month {JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC}

    public virtual class RRuleException extends Exception {}

    // Convert between rrule values and enum values
    private static String getFrequencyString(Frequency f){
        switch on f{
            when YEARLY{
                return 'YEARLY';
            }
            when MONTHLY{
                return 'MONTHLY';
            }
            when WEEKLY{
                return 'WEEKLY';
            }
            when DAILY{
                return 'DAILY';
            }
            when HOURLY{
                return 'HOURLY';
            }
            when MINUTELY{
                return 'MINUTELY';
            }
            when SECONDLY{
                return 'SECONDLY';
            }
        }
        return null;
    }
    private static Frequency getFrequencyEnum(String f){
        switch on f.toUpperCase(){
            when 'YEARLY'{
                return Frequency.YEARLY;
            }
            when 'MONTHLY'{
                return Frequency.MONTHLY;
            }
            when 'WEEKLY'{
                return Frequency.WEEKLY;
            }
            when 'DAILY'{
                return Frequency.DAILY;
            }
            when 'HOURLY'{
                return Frequency.HOURLY;
            }
            when 'MINUTELY'{
                return Frequency.MINUTELY;
            }
            when 'SECONDLY'{
                return Frequency.SECONDLY;
            }
        }
        return null;
    }

    private static String getWeekString(Week w){
        switch on w{
            when MON{
                return 'MO';
            }
            when TUE{
                return 'TU';
            }
            when WED{
                return 'WE';
            }
            when THU{
                return 'TH';
            }
            when FRI{
                return 'FR';
            }
            when SAT{
                return 'SA';
            }
            when SUN{
                return 'SU';
            }
        }
        return null;
    }
    private static Week getWeekEnum(String w){
        switch on w.toUpperCase(){
            when 'MO'{
                return Week.MON;
            }
            when 'TU'{
                return Week.TUE;
            }
            when 'WE'{
                return Week.WED;
            }
            when 'TH'{
                return Week.THU;
            }
            when 'FR'{
                return Week.FRI;
            }
            when 'SA'{
                return Week.SAT;
            }
            when 'SU'{
                return Week.SUN;
            }
        }
        return null;
    }

    private static Integer getMonthInteger(Month m){
        switch on m{
            when JAN{
                return 1;
            }
            when FEB{
                return 2;
            }
            when MAR{
                return 3;
            }
            when APR{
                return 4;
            }
            when MAY{
                return 5;
            }
            when JUN{
                return 6;
            }
            when JUL{
                return 7;
            }
            when AUG{
                return 8;
            }
            when SEP{
                return 9;
            }
            when OCT{
                return 10;
            }
            when NOV{
                return 11;
            }
            when DEC{
                return 12;
            }
        }
        return null;
    }
    private static Month getMonthEnum(Integer m){
        switch on m{
            when 1{
                return Month.JAN;
            }
            when 2{
                return Month.FEB;
            }
            when 3{
                return Month.MAR;
            }
            when 4{
                return Month.APR;
            }
            when 5{
                return Month.MAY;
            }
            when 6{
                return Month.JUN;
            }
            when 7{
                return Month.JUL;
            }
            when 8{
                return Month.AUG;
            }
            when 9{
                return Month.SEP;
            }
            when 10{
                return Month.OCT;
            }
            when 11{
                return Month.NOV;
            }
            when 12{
                return Month.DEC;
            }
        }
        return null;
    }

    @testVisible
    private Options options;

    public String getTimezone(){
        return this.options?.tzid;
    }
    public void setTimezone(String tzid){
        if (this.options == null) this.options = new Options();

        //TODO validate
        this.options.tzid = tzid;
    }

    public Frequency getFrequency(){
        return this.options?.freq;
    }
    public void setFrequency(Frequency freq){
        if (this.options == null) this.options = new Options();

        this.options.freq = freq;
    }

    public Integer getInterval(){
        return this.options?.interval;
    }
    public void setInterval(Integer interval){
        if (this.options == null) this.options = new Options();

        this.options.interval = interval;
    }

    public Integer getCount(){
        return this.options?.count;
    }
    public void setCount(Integer count){
        if (this.options == null) this.options = new Options();

        this.options.count = count;
    }

    public Datetime getStart(){
        return this.options?.dtstart;
    }
    public void setStart(Datetime s){
        if (this.options == null) this.options = new Options();

        this.options.dtstart = s;
    }
    public Datetime getEnd(){
        return this.options?.until;
    }
    public void setEnd(Datetime e){
        if (this.options == null) this.options = new Options();

        this.options.until = e;
    }
    public Week getWeekStart(){
        return this.options?.wkst;
    }
    public void setWeekStart(Week wkst){
        if (this.options == null) this.options = new Options();

        this.options.wkst = wkst;
    }
    public Set<Week> getByDay(){
        return this.options?.byday;
    }
    public void setByDay(Set<Week> byday){
        if (this.options == null) this.options = new Options();

        this.options.byday = byday;
    }
    public void setByDay(Week byday){
        if (this.options == null) this.options = new Options();

        this.options.byday = new Set<Week>{byday};
    }
    public void addByDay(Week day){
        if (this.options == null) this.options = new Options();
        if (this.options.byday == null) this.options.byday = new Set<Week>();
        
        this.options.byday.add(day);
    }

    public Set<Month> getByMonth(){
        return this.options?.bymonth;
    }
    public void setByMonth(Set<Month> bymonth){
        if (this.options == null) this.options = new Options();

        this.options.bymonth = bymonth;
    }
    public void setByMonth(Month bymonth){
        if (this.options == null) this.options = new Options();

        this.options.bymonth = new Set<Month>{bymonth};
    }
    public void addByMonth(Month m){
        if (this.options == null) this.options = new Options();
        if (this.options.bymonth == null) this.options.bymonth = new Set<Month>();
        
        this.options.bymonth.add(m);
    }

    public RRule() {
        this.options = new Options();
    }

    private RRule(Options opts) {
        this.options = opts;
    }

    /**
     * between
     *  returns a list of all of the dtstart values in a date range
     * @param s
     *  start of range
     * @param e
     *  end of range
     * @param inc
     *  include the bounds in the results
     * @return list of datetimes
     */
    public Datetime[] between(Datetime s, Datetime e, Boolean inc){
        Datetime[] ret = new Datetime[]{};

        return ret;
    }
    public Datetime[] between(Datetime s, Datetime e){
        return this.between(s,e,false);
    }

    /**
     * before
     *  returns the last instance of the recurrence before the datetime
     * @param dt
     *  end bound
     * @param inc
     *  include the bounds in the results
     * @return last datetime instance
     */
    public Datetime before(Datetime dt, Boolean inc){
        Datetime ret;

        return ret;
    }
    public Datetime before(Datetime dt){
        return this.before(dt,false);
    }

    /**
     * after
     *  returns the first instance of the recurrence after the datetime
     * @param dt
     *  start bound
     * @param inc
     *  include the bounds in the results
     * @return first datetime instance
     */
    public Datetime after(Datetime dt, Boolean inc){
        Datetime ret;

        return ret;
    }
    public Datetime after(Datetime dt){
        return this.after(dt,false);
    }

    /**
     * fromString
     *  builds an RRule instance from an ical rrule string.
     * @param rfcString 
     *  rrule String in iCalendar-RFC-5545 3-8-5-3 format
     *  https://icalendar.org/iCalendar-RFC-5545/3-8-5-3-recurrence-rule.html
     * @return new RRule instance
     */
    public static RRule fromString(String rfcString){
        RRule ret;
        Options opts;
        if (rfcString.length()>0){
            String[] lines = rfcString.split('\\n');
            if (lines.size() == 1)
                lines = rfcString.split('\\r\\n');

                opts = new Options();
                for (String line : lines){
                    opts.mergeOptions(parseLine(line));
                }
            if (opts != null){
                ret = new RRule(opts);
            }
        }
        return ret;
    }

    private static Options parseLine(String rfcString){
        Options ret;

        rfcString = rfcString.replaceAll('^\\s+|\\s+$', '');

        if (rfcString.length() == 0) 
            return null;

        Pattern header_pattern = Pattern.compile('^([A-Z]+?)[:;]');
        Matcher m = header_pattern.matcher(rfcString.toUpperCase());

        if (!m.matches()){
            return parseRRule(rfcString);
        }

        String key = m.group(1);
        switch on key.toUpperCase(){
            when 'RRULE','EXRULE'{
                return parseRRule(rfcString);
            }
            when 'DTSTART'{
                return parseDtStart(rfcString);
            }
            when else{
                throw new RRuleException('Unsupported RFC Prop: \''+key+'\' in \''+rfcString+'\'');
            }
        }
    }
    private static Options parseRRule(String line){
        Options ret = new Options();
        String stripped_line = line.replaceAll('^RRULE:', '');
        ret.mergeOptions(parseDtstart(stripped_line));

        String[] attrs = line.replaceAll('^(?:RRULE|EXRULE):', '').split(';');

        for (String att : attrs){
            String[] splt = att.split('=');
            if (splt.size() >= 2){
                String key = splt[0];
                String value = splt[1];

                switch on key.toUpperCase(){
                    when 'FREQ'{
                        ret.freq = getFrequencyEnum(value);
                    }
                    when 'WKST'{
                        ret.wkst = getWeekEnum(value);
                    }
                    when 'COUNT'{
                        if (value != null)
                            ret.count = Integer.valueOf(value);
                    }
                    when 'INTERVAL'{
                        if (value != null)
                            ret.interval = Integer.valueOf(value);
                    }
                    when 'BYMONTH'{
                        if (value != null){
                            String[] vals = value.split(',');
                            Set<Month> by_month = new Set<Month>();
                            for (String val : vals){
                                by_month.add(getMonthEnum(Integer.valueOf(val)));                                
                            }
                            ret.bymonth = by_month;
                        }
                    }
                    when 'BYWEEKDAY','BYDAY'{
                        if (value != null){
                            String[] vals = value.split(',');
                            Set<Week> by_day = new Set<Week>();
                            for (String val : vals){
                                by_day.add(getWeekEnum(val));
                            }
                            ret.byday = by_day;
                        }
                        
                    }
                    when 'DTSTART','TZID'{
                        Options opts = parseDtstart(line);

                        if (opts != null && opts.dtstart != null){
                            ret.dtstart = opts.dtstart;
                        }
                    }
                    when 'UNTIL'{
                        DateTime  dt = parseDate(value);
                        ret.until = dt;

                    }
                    when else{
                        throw new RRuleException('Unknown RRule Property \''+key+'\'');
                    }
                }
            }
        }
        return ret;
    }
    private static Options parseDtStart(String line){
        Options ret = new Options();

        Pattern p = Pattern.compile('DTSTART(?:;TZID=([^:=]+?))?(?::|=)([^;\\s]+)');
        Matcher m = p.matcher(line);

        if (!m.matches()) return ret;

        String tz = m.group(1);
        String dt = m.group(2);

        if (tz != null){
            ret.tzid = tz;
        }

        ret.dtstart = parseDate(dt);
        return ret;
    }
    private static DateTime parseDate(String dt){
        Pattern p = Pattern.compile('^(\\d{4})(\\d{2})(\\d{2})(T(\\d{2})(\\d{2})(\\d{2})Z?)?$');
        Matcher m = p.matcher(dt);

        if (!m.matches()) throw new RRuleException('Invalid datetime in rrule');

        return DateTime.newInstanceGmt(
            Integer.valueOf(m.group(0)), 
            Integer.valueOf(m.group(1)), 
            Integer.valueOf(m.group(2)), 
            Integer.valueOf(m.group(3)),
            Integer.valueOf(m.group(4)),
            Integer.valueOf(m.group(5))
        );
    }
    public class Options{
        public String tzid;
        public DateTime dtstart;
        public DateTime until;
        public Integer count;
        public Integer interval;
        public Frequency freq;
        public Week wkst = Week.SUN;
        public Set<Week> byday;
        public Set<Month> bymonth;

        public Options(){}

        public void mergeOptions(Options opt){
            if (opt != null){
                if (opt.dtstart != null) this.dtstart = opt.dtstart;
                if (opt.until != null) this.until = opt.until;
                if (opt.count != null) this.count = opt.count;
                if (opt.interval != null) this.interval = opt.interval;
                if (opt.freq != null) this.freq = opt.freq;
                if (opt.wkst != null) this.wkst = opt.wkst;
                if (opt.byday != null) this.byday = opt.byday;
                if (opt.bymonth != null) this.bymonth = opt.bymonth;
                if (opt.tzid != null) this.tzid = opt.tzid;
            }
        }
        
    }
}