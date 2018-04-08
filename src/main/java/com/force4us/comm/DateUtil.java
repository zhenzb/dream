package com.force4us.comm;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");

    public Date getDateTiem(){
        return new Date();
    }

    public String DateToDateString(Date dateTime){
        return sdf.format(dateTime);
    }
}
