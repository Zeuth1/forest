package com.kh.forest.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.server.ServerEndpoint;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.forest.setting.model.dao.SettingDaoImpl;


public class EchoHandler extends TextWebSocketHandler implements InitializingBean{
	
	@Autowired
	SettingDaoImpl sd;
	
	private List<WebSocketSession> sessionList =  new ArrayList<WebSocketSession>();
	
	
	private final Logger logger = LogManager.getLogger(getClass());
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	public EchoHandler(){
		
		super();
		this.logger.info("create SocketHandler instance!");
		
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session,
				 CloseStatus status) throws Exception{
		
		super.afterConnectionClosed(session, status);
		this.logger.info("remove SEssion");
		
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		super.afterConnectionEstablished(session);
		sessionSet.add(session);
		this.logger.info("add session!");
		
	}
	
	@Override
	public boolean supportsPartialMessages(){
		
		this.logger.info("call method!");
		return super.supportsPartialMessages();
	}
	
	public void sendMessage (String message){
		
		for(WebSocketSession session:this.sessionSet){
			
			if(session.isOpen()){
				
				
				try {
					session.sendMessage(new TextMessage(message));
				} catch (IOException e) {

					this.logger.error("fail to send Message",e);
				}
				
			}
			
		}
		
	}
	@Override
	public void afterPropertiesSet(){
		
		
		Thread thread = new Thread(){
			
			int i =0;
			
			public void run(){
				
				while(true){
					
					sendMessage("send message index"+i++);
					try {
						Thread.sleep(1000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						break;
					}
					
				}
			}
			
		};
		thread.start();
	}
	@Override
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		
		System.out.println("메시지받음");
		for(WebSocketSession sess:sessionList){
			
			sess.sendMessage(new TextMessage("echo:"+ message.getPayload()));
			
		}
		
		
	}
	
}
