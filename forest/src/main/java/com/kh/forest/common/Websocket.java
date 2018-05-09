package com.kh.forest.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.forest.setting.model.service.SettingService;
import com.kh.forest.setting.model.service.SettingServiceImpl;

@ServerEndpoint("/echo")
@Controller
public class Websocket extends TextWebSocketHandler implements InitializingBean {
	/*private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	*/static List<Member> sessionUsers = Collections.synchronizedList(new ArrayList<>());
    
	Member m= new Member();
	SettingService ss=new SettingServiceImpl();


	@OnOpen
    public void handleOpen(Session session){
        System.out.println("client is now connected...");
       /* sessionList = new ArrayList<WebSocketSession>();
       */ 
        System.out.println("지금 몇번이니?"+session.getId());
        
        
    }
    @OnMessage
    public String handleMessage(String message, Session session) throws IOException{
       
    	m.setmName(message.substring(message.indexOf('[')+1,message.indexOf(']')));
    	if(message.contains("<")&&message.contains(">")) {
    		String taker=message.substring(message.indexOf('<')+1,message.indexOf('>'));
	    	session.getBasicRemote().sendText(message);
    	}
    	
    		
    	sessionUsers.add(m);
    	System.out.println("아이디"+m);
       
    	
    	
    	System.out.println(m);
    	System.out.println("receive from client : "+message);
        String replymessage = m.getmName();
        
        System.out.println("send to client : "+replymessage);
        
        
        return replymessage;
        
    }
   @OnClose
    public void handleClose(){
        System.out.println("client is now disconnected...");
    }
   @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
	@Override
	public void afterPropertiesSet() throws Exception {
	System.out.println("여긴언제오니?");
		
	}


	
	
}
