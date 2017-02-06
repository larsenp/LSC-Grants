using System;
using System.Reflection;
using System.Xml;
using Core.DataAccess.XMLAccess;

namespace Core.Util {

///<summary>
///wrapper around .NET reflection functionality -returns methods and types associated with a given class/object
///</summary>
public class cReflection 
{
/*====================================================*/
/*
	instantiates an object of type aFullClassName, using reflection
	* aFullClassName must be fully qualified
*/
	public static Object InstantiateObjectFromClassName(Assembly aAsm, String aFullClassName, Object[] aArgs) {
		Type	aType = aAsm.GetType(aFullClassName);
		
		return Activator.CreateInstance(aType, aArgs);
	}

/*-----------------------------------------------------*/

	public static Object InstantiateObjectFromClassName(String aAsmName, String aFullClassName, Object[] aArgs) {
		Assembly aAsm = Assembly.Load(aAsmName);
		
		return InstantiateObjectFromClassName(aAsm, aFullClassName, aArgs);
	}

/*====================================================*/

	public static Type TypeFromClassName(String aAsmName, String aFullClassName) {
		Assembly aAsm = Assembly.Load(aAsmName);
		
		return aAsm.GetType(aFullClassName);
	}

/*-----------------------------------------------------*/

	public static bool TypeBasedFrom(Type aType, Type aBaseType) {
		return (aType == aBaseType || aType.IsSubclassOf(aBaseType));
	}
	
/*-----------------------------------------------------*/

	public static bool TypeBasedFrom(Type aType, String aAsmName, String aFullClassName) {
		Type	aBaseType = TypeFromClassName(aAsmName, aFullClassName);
		
		return TypeBasedFrom(aType, aBaseType);
	}
	
/*====================================================*/
/*
	public static Object InstantiateObjectFromXMLClassNode(XmlNode aClassNode, Object[] aArgs) {
		return InstantiateObjectFromClassName(cXMLDoc.AttributeToString(aClassNode, "Assembly"),
												cXMLDoc.AttributeToString(aClassNode, "FullName"), aArgs);
	}
*/
/*====================================================*/

	public static Object InstantiateObjectFromXMLClassNode(XmlNode aClassNode, Object[] aSrcArgs) {
		XmlNodeList		aArgumentsNodeList;
		int numNodes = 0;
		int count = 0;

		aArgumentsNodeList = aClassNode.SelectNodes("Arguments/Argument");
		
		numNodes = aArgumentsNodeList.Count;
			
		Object[] aArgs = new Object[numNodes + (aSrcArgs == null ? 0 : aSrcArgs.Length)];
		
		if (aSrcArgs != null)
			foreach (Object aObj in aSrcArgs) {
				aArgs[count]= aObj;
				count++;
			}
			
		foreach(XmlNode aArgumentsNode in aArgumentsNodeList) {
			aArgs[count]= cXMLDoc.AttributeToString(aArgumentsNode, "Value");
			count++;
		}
		
		/*
		return InstantiateObjectFromClassName(cXMLDoc.AttributeToString(aClassNode, "Assembly"),
											cXMLDoc.AttributeToString(aClassNode, "FullName"), aArgs);
		*/
		return InstantiateObjectFromClassName(cXMLDoc.AttributeToString(aClassNode, "Assembly"),
												cXMLDoc.AttributeToString(aClassNode, "FullName"), aArgs);
	}

/*-----------------------------------------------------*/

	public static Object InstantiateObjectFromXMLClassNode(XmlNode aClassNode) {
		return InstantiateObjectFromXMLClassNode(aClassNode, null);
	}

/*====================================================*/

	public static Object Invoke_Property(Object aSourceObj, String aPropName) {
		Type aType = aSourceObj.GetType();
		PropertyInfo aProperty = aType.GetProperty(aPropName);
		
		return aProperty.GetValue(aSourceObj, null);
	}

/*-----------------------------------------------------*/

	public static void Set_Property(Object aSourceObj, String aPropName, Object aValue) {
		Type aType = aSourceObj.GetType();
		PropertyInfo aProperty = aType.GetProperty(aPropName);
		Type aPropType = aProperty.PropertyType;
		TypeCode aTypeCode = Type.GetTypeCode(aPropType);
		
		aValue = Convert.ChangeType(aValue, aPropType);
		
		switch (aTypeCode) {
			/*
			case TypeCode.Int16 :
				aProperty.SetValue(aSourceObj, Convert.ToInt16(aValue), null);
				break;
			*/
			
			default :
				aProperty.SetValue(aSourceObj, aValue, null);
				break;
		}
	}

/*====================================================*/

	public static Object Invoke_Field(Object aSourceObj, String aFieldName) {
		Type			aType = aSourceObj.GetType();
		BindingFlags	aFlags = BindingFlags.NonPublic | BindingFlags.Instance;
		FieldInfo		aField = aType.GetField(aFieldName, aFlags);
		
		if (aField == null) return null;
				
		return aField.GetValue(aSourceObj);
	}

/*-----------------------------------------------------*/

	public static bool Set_Field(Object aSourceObj, String aFieldName, Object aValue) {
		Type			aType = aSourceObj.GetType();
		BindingFlags	aFlags = BindingFlags.NonPublic | BindingFlags.Instance;
		FieldInfo		aField = aType.GetField(aFieldName, aFlags);
		
		if (aField == null) return false;
		
		switch (Type.GetTypeCode(aField.GetType())) {
			case TypeCode.Int16 :
				aField.SetValue(aSourceObj, Convert.ToInt16(aValue));
				break;
			
			default :
				aField.SetValue(aSourceObj, aValue);
				break;
		}
		
		return true;
	}

/*====================================================*/

} //class cReflection


}  //Core.Util