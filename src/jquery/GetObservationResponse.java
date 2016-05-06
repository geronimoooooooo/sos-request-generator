package jquery;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.GetObservationRequest;
import utility.Networking;
import utility.ParserGetCapa;

/**
 * Servlet implementation class GetObservationResponse
 */
@WebServlet({ "/GetObservationResponse", "/gor" })
public class GetObservationResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetObservationResponse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getParameter("url");
		String msg = request.getParameter("xml");
		
		System.out.println("request:\n"+msg);
		String urlService ="https://ispacevm30.researchstudio.at/focus/service";
		//String msg ="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<env:Envelope\r\n    xmlns:env=\"http://www.w3.org/2003/05/soap-envelope\"\r\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.w3.org/2003/05/soap-envelope http://www.w3.org/2003/05/soap-envelope/soap-envelope.xsd\">\r\n    <env:Body>\r\n        <sos:GetCapabilities\r\n            xmlns:sos=\"http://www.opengis.net/sos/2.0\"\r\n            xmlns:ows=\"http://www.opengis.net/ows/1.1\" service=\"SOS\" xsi:schemaLocation=\"http://www.opengis.net/sos/2.0 http://schemas.opengis.net/sos/2.0/sosGetCapabilities.xsd\">\r\n            <ows:AcceptVersions>\r\n                <ows:Version>2.0.0</ows:Version>\r\n            </ows:AcceptVersions>\r\n            <ows:Sections>\r\n                <ows:Section>OperationsMetadata</ows:Section>\r\n                <ows:Section>ServiceIdentification</ows:Section>\r\n                <ows:Section>ServiceProvider</ows:Section>\r\n                <ows:Section>FilterCapabilities</ows:Section>\r\n                <ows:Section>Contents</ows:Section>\r\n            </ows:Sections>\r\n        </sos:GetCapabilities>\r\n    </env:Body>\r\n</env:Envelope>";
				
			Networking net = new Networking();
			String str_repsonse = net.sendPOST2Webservice(urlService, msg);
			
	        response.setContentType("application/xml");
	        System.out.println("response: "+str_repsonse);
	        response.getWriter().write(str_repsonse);
	        
	       
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
