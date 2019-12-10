package com.amct.mq;

/*import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;*/

public class mqUtil {

	/*private static final String ACTIVEMQ_URL = "tcp://192.168.202.145:61616";

	public static void mqProducer(String msg) {
		try {
			// 创建连接工厂
			ActiveMQConnectionFactory activeMQConnectionFactory = new ActiveMQConnectionFactory(
					ACTIVEMQ_URL);
			// 创建连接
			Connection connection = activeMQConnectionFactory.createConnection();
			// 打开连接
			connection.start();
			// 创建会话
			Session session = connection.createSession(false,
					Session.AUTO_ACKNOWLEDGE);
			// 创建队列目标,并标识队列名称，消费者根据队列名称接收数据
			Destination destination = session.createQueue("myQueue");
			// 创建一个生产者
			MessageProducer producer = session.createProducer(destination);
			// 向队列推送10个文本消息数据
			// 创建文本消息
			TextMessage message = session.createTextMessage(msg);
			// 发送消息
			producer.send(message);
			// 在本地打印消息
			System.out.println("已发送的消息：" + message.getText());
			// 关闭连接
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public static void mqConsume() throws JMSException {
		// 创建连接工厂
		ActiveMQConnectionFactory activeMQConnectionFactory = new ActiveMQConnectionFactory(
				ACTIVEMQ_URL);
		// 创建连接
		Connection connection = activeMQConnectionFactory.createConnection();
		// 打开连接
		connection.start();
		// 创建会话
		Session session = connection.createSession(false,
				Session.AUTO_ACKNOWLEDGE);
		// 创建队列目标,并标识队列名称，消费者根据队列名称接收数据
		Destination destination = session.createQueue("myQueue");
		// 创建消费者
		MessageConsumer consumer = session.createConsumer(destination);
		// 创建消费的监听
		consumer.setMessageListener(new MessageListener() {
			public void onMessage(Message message) {
				TextMessage textMessage = (TextMessage) message;
				try {
					System.out.println("消费的消息：" + textMessage.getText());
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		});
	}

	//test
	public static void main(String[] args) {
		try {
			mqProducer("hello word");
			System.out.println("=======================");
			mqConsume();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
