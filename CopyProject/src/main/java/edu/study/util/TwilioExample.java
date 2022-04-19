package edu.study.util;
//Install the Java helper library from twilio.com/docs/java/install

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class TwilioExample {
	
	// Find your Account Sid and Token at twilio.com/user/account
	public static final String ACCOUNT_SID = "AC78dfad4a8a3a38a5d8bd9e5a0dcf4ad6";
	public static final String AUTH_TOKEN = "ba38af6c9139661c8513dc12b13b670e";
	  
	// SMS 전송
	public static int sendSMS (String country, String phoneNum) {
	
	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	
	// 휴대폰 인증번호 생성
	int authNum = randomRange(100000, 999999);
	
	
	// 전송대상 휴대폰 번호
	String sendTarget = "+"+ country + phoneNum;
	
	// 전송 메세지
	String authMsg = "The authentication number is [" + authNum + "]" ;
	
	
	Message message = Message.creator(
		// to
		new PhoneNumber(sendTarget),
		// from
		new PhoneNumber("+17163002516"), 
		// message
		authMsg).create();
		    
		return authNum;
		
	}
    
	// 인증번호 범위 지정
	public static int randomRange(int n1, int n2) {
		return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	}
	  
	  
}
/*
 * JSON 응답 예시 { "account_sid": "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
 * "api_version": "2010-04-01", "body":
 * "This is the ship that made the Kessel Run in fourteen parsecs?",
 * "date_created": "Thu, 30 Jul 2015 20:12:31 +0000", "date_sent":
 * "Thu, 30 Jul 2015 20:12:33 +0000", "date_updated":
 * "Thu, 30 Jul 2015 20:12:33 +0000", "direction": "outbound-api", "error_code":
 * null, "error_message": null, "from": "+15017122661", "messaging_service_sid":
 * null, "num_media": "0", "num_segments": "1", "price": null, "price_unit":
 * null, "sid": "SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", "status": "sent",
 * "subresource_uris": { "media":
 * "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Media.json"
 * }, "to": "+15558675310", "uri":
 * "/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json"
 * }
 */

