package com.kh.forest.common;

import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.WebSocketSession;

@ServerEndpoint("/echo")
@Controller
public class Websocket {
private List<WebSocketSession> connectedUsers;
    @OnOpen
    public void handleOpen(){
        System.out.println("client is now connected...");
    }
    @OnMessage
    public String handleMessage(WebSocketSession session,String message){
      System.out.println("receive from client : "+message);
        String replymessage = "echo "+message;
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


	
	
}
