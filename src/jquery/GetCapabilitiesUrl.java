package jquery;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import sos.GetCapabilitiesSos;
import sos.Procedure;
import utility.GetObservationRequest;
import utility.Networking;
import utility.ParserGetCapa;

/**
 * Servlet implementation class GetCapabilitiesUrl
 */
@WebServlet({ "/GetCapabilitiesUrl", "/gcu" })
public class GetCapabilitiesUrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCapabilitiesUrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<String>list_procedures = new ArrayList<String>();
		
		String url = request.getParameter("url");
		String fu = request.getParameter("fu");
		System.out.println("das ist url:"+url+ "fu: "+fu);
		
		
		String urlService ="https://ispacevm30.researchstudio.at/sos41/service";
		String msg ="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<env:Envelope\r\n    xmlns:env=\"http://www.w3.org/2003/05/soap-envelope\"\r\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.w3.org/2003/05/soap-envelope http://www.w3.org/2003/05/soap-envelope/soap-envelope.xsd\">\r\n    <env:Body>\r\n        <sos:GetCapabilities\r\n            xmlns:sos=\"http://www.opengis.net/sos/2.0\"\r\n            xmlns:ows=\"http://www.opengis.net/ows/1.1\" service=\"SOS\" xsi:schemaLocation=\"http://www.opengis.net/sos/2.0 http://schemas.opengis.net/sos/2.0/sosGetCapabilities.xsd\">\r\n            <ows:AcceptVersions>\r\n                <ows:Version>2.0.0</ows:Version>\r\n            </ows:AcceptVersions>\r\n            <ows:Sections>\r\n                <ows:Section>OperationsMetadata</ows:Section>\r\n                <ows:Section>ServiceIdentification</ows:Section>\r\n                <ows:Section>ServiceProvider</ows:Section>\r\n                <ows:Section>FilterCapabilities</ows:Section>\r\n                <ows:Section>Contents</ows:Section>\r\n            </ows:Sections>\r\n        </sos:GetCapabilities>\r\n    </env:Body>\r\n</env:Envelope>";
		
		if(!GetObservationRequest.alreadyGotCapabilities){
			Networking net = new Networking();
			String str_repsonse = net.sendPOST2Webservice(urlService, msg);
			ParserGetCapa parseGetCapa = new ParserGetCapa();
			parseGetCapa.parseGetCapabilitiesXml(str_repsonse);
		}
		GetObservationRequest.alreadyGotCapabilities = true;
		
		for(Procedure pro: GetCapabilitiesSos.list_procedures){
			list_procedures.add(pro.procedureUrn);
		}
	    String json = new Gson().toJson(list_procedures);
        response.setContentType("application/json");
        response.getWriter().write(json);
//		
//        response.setContentType("text/plain");
//        response.getWriter().append("Served at: ").append(request.getContextPath());
//        response.getWriter().write(str_repsonse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
