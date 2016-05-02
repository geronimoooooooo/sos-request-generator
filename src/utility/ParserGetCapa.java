package utility;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.xml.namespace.NamespaceContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import ch.qos.logback.classic.Logger;
import sos.GetCapabilitiesSos;
import sos.Procedure;

import org.xml.sax.InputSource;

public class ParserGetCapa {
	
	Logger logger = (Logger) LoggerFactory.getLogger(getClass().getName());
	
	public void parseGetCapabilitiesXml(String getCapabilitiesResponse){
		
		ArrayList<String> list_procedures = new ArrayList<String>();
		DocumentBuilder dbuilder = null;
		Document doc =  null;
		String xml_final;
		
		try {			
			XPath xPath = XPathFactory.newInstance().newXPath();
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			dbFactory.setNamespaceAware(true);
	        DocumentBuilder builder = dbFactory.newDocumentBuilder();
	        doc = builder.parse(new InputSource(new StringReader(getCapabilitiesResponse)));
	        
	       
			xPath.setNamespaceContext(new NamespaceContext() {
				
				@Override
				public Iterator getPrefixes(String namespaceURI) {
					// TODO Auto-generated method stub
					return null;
				}
				
				@Override
				public String getPrefix(String namespaceURI) {
					// TODO Auto-generated method stub
					return "swe";
				}			
				
				   @Override
		            public String getNamespaceURI(String args) {
					   		if("swe".equals(args)) {
		                    return "http://www.opengis.net/swe/1.0.1";
		                }else if("sos".equals(args)){
		                	return "http://www.opengis.net/sos/2.0";
		                }else if("ows".equals(args)){
		                	return "http://www.opengis.net/ows/1.1";
		                }else if("soap".equals(args)){
		                	return "http://www.w3.org/2003/05/soap-envelope";             	
		                }else if("fes".equals(args)){
		                	return "http://www.opengis.net/fes/2.0";             	
		                }else if("swes".equals(args)){
		                	return "http://www.opengis.net/swes/2.0";             	
		                }else if("gml".equals(args)){
		                	return "http://www.opengis.net/gml/3.2";             	
		                }
		                return null;
		            }
			});
			
			/*
			String path_offering = "/Envelope/Body/InsertObservation/offering";
			Node node_offering = (Node)xPath.compile(path_offering).evaluate(doc, XPathConstants.NODE);
			System.out.println("offering: "+node_offering.getTextContent());
						
			String path_procedure_href = "/Envelope/Body/InsertObservation/observation/OM_Observation/procedure/@href";
			Node node_procedure_href = (Node)xPath.compile(path_procedure_href).evaluate(doc, XPathConstants.NODE);
			System.out.println("procedure: "+node_procedure_href.getTextContent());
			*/
					
			logger.debug("sind da: "+ getCapabilitiesResponse);
			
			String path_version = "/soap:Envelope/soap:Body/sos:Capabilities/@version";
			Node node_version = (Node)xPath.compile(path_version).evaluate(doc, XPathConstants.NODE);
						
			String path_procedures = "//ows:Operation[@name='GetObservation']/ows:Parameter[@name='procedure']/ows:AllowedValues/ows:Value";
			NodeList node_procedures = (NodeList)xPath.compile(path_procedures).evaluate(doc, XPathConstants.NODESET);
			
			for(int n = 0; n<node_procedures.getLength(); n++){
				list_procedures.add(node_procedures.item(n).getTextContent());
				Procedure pro = new Procedure();
				pro.procedureUrn= node_procedures.item(n).getTextContent();
				GetCapabilitiesSos.list_procedures.add(pro);
			}		
			
			for(int i = 0; i < GetCapabilitiesSos.list_procedures.size(); i++){
				String path_observedProperty = "//swes:offering/sos:ObservationOffering[swes:procedure='"+GetCapabilitiesSos.list_procedures.get(i).procedureUrn+"']/swes:observableProperty";
				NodeList node_observedProperty = (NodeList)xPath.compile(path_observedProperty).evaluate(doc, XPathConstants.NODESET);		
				
				for(int n = 0; n<node_observedProperty.getLength(); n++){
					GetCapabilitiesSos.list_procedures.get(i).list_observedProperty.add(node_observedProperty.item(n).getTextContent());					
				}
				//remove duplicates
				Set<String> hs = new HashSet<>();
				hs.addAll(GetCapabilitiesSos.list_procedures.get(i).list_observedProperty);
				GetCapabilitiesSos.list_procedures.get(i).list_observedProperty.clear();
				GetCapabilitiesSos.list_procedures.get(i).list_observedProperty.addAll(hs);
				
			}
			
			for(Procedure p: GetCapabilitiesSos.list_procedures){
				logger.debug("procedureURN: "+p.procedureUrn);
				for(String s:p.list_observedProperty){
					logger.debug(s);
				}
				logger.debug("########################################################");
			}
			
			//list_procedures.forEach(e->logger.debug(e));
			
			Procedure procedure = new Procedure();
			//procedure.procedureUrn ="http://wahlers.forsttechnik.de/harvester/ponsse/c44/enginecontrol/procedure/1B23234564";
			procedure.procedureUrn= "http://wahlers.forsttechnik.de/harvester/ponsse/c44/enginecontrol/procedure/1A232345646";
			String path_observedProperty = "//swes:offering/sos:ObservationOffering[swes:procedure='http://wahlers.forsttechnik.de/harvester/ponsse/c44/enginecontrol/procedure/1B23234564']/swes:observableProperty";
			NodeList node_observedProperty = (NodeList)xPath.compile(path_observedProperty).evaluate(doc, XPathConstants.NODESET);
			
			for(int n = 0; n<node_observedProperty.getLength(); n++){
				procedure.list_observedProperty.add(node_observedProperty.item(n).getTextContent());				
			}
			
			
			procedure.list_observedProperty.forEach(e->logger.debug(e));
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			String path_time = "//ows:Parameter/@version";
			NodeList nodes_path_time = (NodeList)xPath.compile(path_time).evaluate(doc, XPathConstants.NODESET);
			System.out.println("node: "+ nodes_path_time.item(0).getTextContent());
			
			String path_description_system3 = "//sos:Capabilities/@version";
			Node node_description_system3 = (Node)xPath.compile(path_description_system3).evaluate(doc, XPathConstants.NODE);
			System.out.println("version 3: "+node_description_system3.getTextContent());
			
			
			
			String path_description_system = "//Parameter[@name='procedure']/AllowedValues/Value";
			Node node_description_system = (Node)xPath.compile(path_description_system).evaluate(doc, XPathConstants.NODE);
			System.out.println("description_system: "+node_description_system.getTextContent());
			
			String path_keyword1 = "/Envelope/Body/InsertSensor/procedureDescription/SensorML/member/System/keywords/KeywordList/keyword[1]";
			Node node_keyword1 = (Node)xPath.compile(path_keyword1).evaluate(doc, XPathConstants.NODE);
			System.out.println("path_keyword1: "+node_keyword1.getTextContent());
			
			String path_keyword = "/Envelope/Body/InsertSensor/procedureDescription/SensorML/member/System/keywords/KeywordList/keyword";
			NodeList nodes_keywords = (NodeList)xPath.compile(path_keyword).evaluate(doc, XPathConstants.NODESET);
			//System.out.println("path_keyword1: "+nodes_keyword1.getTextContent());
			for(int j=0;j<nodes_keywords.getLength();j++){
				Element el = (Element)nodes_keywords.item(j);
				System.out.println("keywords: "+ el.getTextContent());
			}
			
			String path_procedure_unique = "/Envelope/Body/InsertSensor/procedureDescription/SensorML/member/System/identification/IdentifierList/identifier/Term/value";
			Node node_procedure_unique = (Node)xPath.compile(path_procedure_unique).evaluate(doc, XPathConstants.NODE);
			System.out.println("path_procedure_unique: "+node_procedure_unique.getTextContent());
			
			String path_offerings_value = "/Envelope/Body/InsertSensor/procedureDescription/SensorML/member/System/capabilities/SimpleDataRecord/field/Text/value";
			Node node_offerings_value = (Node)xPath.compile(path_offerings_value).evaluate(doc, XPathConstants.NODE);
			System.out.println("path_offerings_value: "+node_offerings_value.getTextContent());
			
			String path_easting = "/Envelope/Body/InsertSensor/procedureDescription/SensorML/member/System/position/Position/location/Vector/coordinate/Quantity/value";
			Node node_easting = (Node)xPath.compile(path_easting).evaluate(doc, XPathConstants.NODE);
			System.out.println("path_easting: "+node_easting.getTextContent());
			
			String path_observationProperty = "/Envelope/Body/InsertSensor/procedureDescription/SensorML/member/System/outputs/OutputList/output";
			NodeList nodelist_observationProperty = (NodeList)xPath.compile(path_observationProperty).evaluate(doc, XPathConstants.NODESET);
		
			String path_obsProperty_relativ = "//Quantity/@definition";
			NodeList nodelist_obsProperty_relativ = (NodeList)xPath.compile(path_obsProperty_relativ).evaluate(doc, XPathConstants.NODESET);
			
			String path_TextValue = "//Text/value";
			NodeList nodelist_TextValue = (NodeList)xPath.compile(path_TextValue).evaluate(doc, XPathConstants.NODESET);
			
//			for(int k=0;k<nodelist_observationProperty.getLength();k++){
//				System.out.println("e1:"+ nodelist_observationProperty.item(k));		
//			}
			System.out.println("=========");
			for(int j=0;j<nodelist_observationProperty.getLength();j++){
				Element el = (Element)nodelist_observationProperty.item(j);
				System.out.println("outputName: "+el.getAttribute("name"));
				System.out.println("obsPropery: "+nodelist_obsProperty_relativ.item(j));
				System.out.println("Text_Value: "+nodelist_TextValue.item(j).getTextContent());
			//	System.out.println("obsPropery:  "+node_obsProperty_relativ.getLength());
				
				
				
				//System.out.println("el.getAttribute('name'). "+el.getAttribute("name"));
				
			//	String path_obsProperty_name ="//output/@name";
			//	NodeList node_obsProperty_name = (NodeList)xPath.compile(path_obsProperty_name).evaluate(doc, XPathConstants.NODESET);
				//System.out.println("name: "+ node_obsProperty_name.getTextContent());
			/*	for(int k=0;k<node_obsProperty_name.getLength();k++){
					Node n2 = node_obsProperty_name.item(k);
					System.out.println("nameXXXXXXX: "+ n2.getTextContent());
				}*/
				//Node n2 = node_obsProperty_name.item(0);
			//	System.out.println("nameeeeeeee: "+ n2.getTextContent());
				
				
				
			}
			
			} catch (ParserConfigurationException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SAXException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				
				e.printStackTrace();
			}
	        
	}

}
