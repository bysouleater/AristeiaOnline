package aristeiaonline

import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

class DateTagLib {
	
	def dateFromNow = { attrs ->
		def date = attrs.date
		def niceDate = getNiceDate(date)
		out << niceDate
	}
	
	String getNiceDate(Date date){
		def now = new Date()
		def diff = Math.abs(now.time -date.time)
		long second = 1000
		long minute = second * 60
		long hour = minute * 60
		long day = hour * 24
		def niceTime = ""
		long calc = 0;
		calc = Math.floor(diff / day)
		DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd");
		
		if (calc) {
			if(calc > 1)
				return fmt.print(date.getTime()) 
			niceTime += calc + " day" + (calc > 1 ? "s " : " ")
			diff %= day
		}
		calc = Math.floor(diff / hour)
		if (calc) {
			niceTime += calc + " hour" + (calc > 1 ? "s " : " ")
			diff %= hour
		}
		calc = Math.floor(diff / minute)
		if (calc) {
			niceTime += calc + " minute" + (calc > 1 ? "s " : " ")
			diff %= minute
		}
		if (!niceTime) {
			niceTime = "A few seconds ago"
		} else {
			niceTime += (date.time > now.time) ? "from now" : "ago"
		}
		return niceTime
		
	}

}
