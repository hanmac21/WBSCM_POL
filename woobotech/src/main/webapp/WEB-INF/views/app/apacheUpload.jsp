<%@ page contentType="text/html;charset=KSC5601"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>

<html>
<head>
<title>Apache ServletFileUpload example</title>
</head>
<body>
	<center>
		<table>
			<tr>
				<td><h1>���� ���ε� ���</h1></td>
			</tr>
			<tr>
				<td>
					<%
					System.out.println("����Ǿ����ϴ�");
						boolean isMultipart = ServletFileUpload.isMultipartContent(request);
						if (!isMultipart) {
						} else {
							FileItemFactory factory = new DiskFileItemFactory();
							ServletFileUpload upload = new ServletFileUpload(factory);
							List items = null;
							try {
								items = upload.parseRequest(request);
							} catch (FileUploadException e) {
								System.out.println("���� 1: " + e);
							}
							Iterator itr = items.iterator();
							while (itr.hasNext()) {
								FileItem item = (FileItem) itr.next();
								if (item.isFormField()) { // ������ �ƴ� ���ʵ忡 �Է��� ������ ������.
									if (item != null && item.getFieldName().equals("name")) {
										String name = item.getString("KSC5601");//form field �ȿ� �Է��� �����͸� ������
										System.out.println("������:" + name + "<br>");
									} else if (item != null && item.getFieldName().equals("pwd")) {
										String desc = item.getString("KSC5601");
										System.out.println("���Ͽ� ���� ����:" + desc + "<br>");
									}
								} else { // �� �ʵ尡 �ƴϰ� ������ ���
									try {
										String itemName = item.getName();//���� �ý��� ���� ���ϰ�� �� ���� �̸� ����
										if (itemName == null || itemName.equals(""))
											continue;
										String fileName = FilenameUtils.getName(itemName);// ��ξ��� �����̸��� ������
									 	// ���۵� ������ ������ �����ϱ� ���� ����
										//String rootPath = getServletContext().getRealPath("/");
										//File savedFile = new File("/web/home/joongchoun/html/upload/storage/" + fileName);
										File path2 = new File(".");
    									System.out.println(path2.getAbsolutePath()); //--> ������Ʈ ������ �ּҰ� ��µ�
										
										//File savedFile = new File(path2+"/download/" + fileName);
    									
										//File savedFile = new File("D:/mediashare/media/" + fileName);
										File savedFile = new File("C:/Program Files/Apache Software Foundation/Tomcat 7.0/webapps/fortune/asset/info_img/" + fileName);
										item.write(savedFile);// ���� ��ο� ������ ������

										System.out.println("<tr><td><b>�������� ���:</b></td></tr><tr><td><b>" + savedFile + "</td></tr>");
										System.out.println("<tr><td><b><a href=\"DownloadServlet?file=" + fileName + "\">" + fileName
												+ "</a></td></tr>");
									} catch (Exception e) {
										System.out.println("������ ���� ������ ����: " + e);
									}
								}
							}
						}
					%>
				
		</table>
	</center>
</body>
</html>