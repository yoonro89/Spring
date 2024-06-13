package advice;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.springframework.beans.factory.annotation.Autowired;

public class Advice {
	@Autowired
	HttpServletRequest request;
	
	//감시객체
	//JoinPoint : pointcut이 걸린 위치의 정보를 받는 메서드
	long start;
	
	public void before(JoinPoint jp) {
		Signature s = jp.getSignature();
		System.out.println("--before:" + s);
		
		//before()가 호출됐을 때의 시간
		start = System.currentTimeMillis();
		request.setAttribute("start", start);
	}
	
	public void after(JoinPoint jp) {
		Signature s = jp.getSignature();
		System.out.println("--after:" + s);
		
		start = (Long)request.getAttribute("start");
		long end = System.currentTimeMillis();
		System.out.printf("[수행시간] : %d(ms)/n", end - start);
	}
}
