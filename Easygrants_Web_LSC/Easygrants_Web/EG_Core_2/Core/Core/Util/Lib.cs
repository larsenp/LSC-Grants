using System;
using System.Collections;
using System.Text.RegularExpressions;

namespace Core.Util {


public enum ModuleIDs : int  {
	Login = 1
}

///<summary>
///Library of miscellaneous classes
///</summary>
public class cLib 
{
/*====================================================*/

	public static String ControlName(int aRowNum, int aColNum, int aMinNumDigits) {
		String	aStr;
		
		aStr = Convert.ToString(aColNum);
		aStr = aStr.PadLeft(aMinNumDigits, '0');
		aStr = "_" + aStr;
		aStr = Convert.ToString(aRowNum) + aStr;
		
		return aStr.PadLeft((aMinNumDigits * 2) + 1, '0');
	}

/*====================================================*/
/*
	returns the left characters up to the smaller of aStr.Length and aMax
*/
	public static String LeftChars(String aStr, int aMax) {
		return aStr.Substring(0, Math.Min(aStr.Length, aMax));
	}

/*-----------------------------------------------------*/

	public static int GetCharPostition(String aSourceTextStr, String aCharStr) {
		return aSourceTextStr.IndexOf(aCharStr);
	}
		
/*====================================================*/

	public static String ExtensionFromFileName(String aFileName, String aDfltExt) {
		int		aExtIndex;
		
		aExtIndex = aFileName.LastIndexOf('.');
		if (aExtIndex == -1)
			return aDfltExt;
			
		return aFileName.Substring(aExtIndex+1);
	}

/*-----------------------------------------------------*/
/*
	* given: myfile.doc
		returns myfile, doc
	* can handle any length extension
*/
	public static void FileName_Extension_From_FullFileName(String aFullFileName,
							out String aFileName, out String aExtension) {
		int		aIndex;
		
		aIndex = aFullFileName.LastIndexOf(".");
		aFileName = aFullFileName.Substring(0, aIndex);
		aExtension = aFullFileName.Substring(aIndex+1, aFullFileName.Length - (aIndex+1));
	}

/*----------------------------------------------------*/
/*
	* given: \\agfile1\projects\PDQ\myfile.doc
		returns \\agfile1\projects\PDQ, myfile.doc
*/
	public static void Path_FullFileName_From_FullPathName(String aFullPath,
							out String aPath, out String aFullFileName) {
		int		aIndex;
		
		aIndex = aFullPath.LastIndexOf("\\");
		aPath = aFullPath.Substring(0, aIndex);
		aFullFileName = aFullPath.Substring(aIndex+1, aFullPath.Length - (aIndex+1));
	}

/*----------------------------------------------------*/
/*
	* given: \\agfile1\projects\PDQ\myfile.doc
		returns \\agfile1\projects\PDQ, myfile, doc
*/
	public static void Path_FileName_Extension_From_FullPathName(String aFullPath,
							out String aPath, out String aFileName, out String aExtension) {
		Path_FullFileName_From_FullPathName(aFullPath,
							out aPath, out aFileName);
		FileName_Extension_From_FullFileName(aFileName,
							out aFileName, out aExtension);
	}

/*====================================================*/
/*
*/
	public static int WordCount_From_Str(String aStr) {
		int			aIndex,
					aWordCount = 0;
		bool		aOpenFlag = false;
		
		aStr = aStr.Trim();
		
		if (aStr.Length > 0) {
			for (aIndex = 0; aIndex < aStr.Length; aIndex++) {
				if (!aOpenFlag && !Char.IsWhiteSpace(aStr[aIndex]))
					aOpenFlag = true;
				else if (Char.IsWhiteSpace(aStr[aIndex]) && aOpenFlag) {
					aWordCount += 1;
					aOpenFlag = false;
				}
			}
			
			if (!Char.IsWhiteSpace(aStr[aIndex-1]) && aOpenFlag)
				aWordCount++;
		}
		
		return aWordCount;
	}

/*====================================================*/

	public static Byte[] Bytes_From_File(String aFileName) {
		System.IO.FileStream	aFile;
		Byte[]					aByteArray;
	
		aFile = System.IO.File.OpenRead(aFileName);
		aByteArray = new Byte[aFile.Length];

		aFile.Read(aByteArray, 0, (int)aFile.Length);
		aFile.Close();
		
		return aByteArray;
	}

/*====================================================*/

	public static void Runtime_Error() {
		Object	aObj = null;
		String	aStr;
		
		aStr = aObj.ToString();
	}

/*-----------------------------------------------------*/

	public static ArrayList CreateArrayFromList(String aList) {
		bool aOpen = false;
		ArrayList aArray = new ArrayList();
		String aItem = "";
		
		for (int i = 0; i < aList.Length; i++) {
			if ((int)aList[i] == 34) {
				if (aOpen) {
					aArray.Add(aItem.ToString());
					aOpen = false;
					aItem = "";
				} else {
					aOpen = true;
					aItem = "";
				}
			}
			else
			{
				aItem += aList[i].ToString();
			}
		}
		
		return aArray;
	}

/*-----------------------------------------------------*/

	public static String CreateFullDate(String aDate, String aFormat) {
		int i;
		Boolean aFirst = true;
		String aResult = "";
		
		for (i = 0; i < aDate.Length; i++) {
			if(aDate[i].ToString() == "/" && aFirst) {
				aResult = aResult + "/01";
				aFirst = false;
			}
			aResult = aResult + aDate[i].ToString();
		}
		return aResult;		
	}

/*----------------------------------------------------*/

	public static int Month_From_MMYY(String aDateMMYY) {
		Regex aRX;
		aRX = new Regex("^\\d{1,2}\\/\\d{4}$");
		int aMonth;
		
		if(!aRX.IsMatch(aDateMMYY))
			return 0;
		aMonth = Convert.ToInt32(aDateMMYY.Substring(0,aDateMMYY.IndexOf("/")));
		return aMonth;
		
	}

/*----------------------------------------------------*/

	public static int Year_From_MMYY(String aDateMMYY) {
		Regex aRX;
		aRX = new Regex("^\\d{1,2}\\/\\d{4}$");
		int aYear;
		
		if(!aRX.IsMatch(aDateMMYY))
			return 0;
		aYear = Convert.ToInt32(aDateMMYY.Substring(aDateMMYY.IndexOf("/") + 1, 4));
		return aYear;
	}

/*----------------------------------------------------*/

	public static bool Validate_Start_End_Dates_MMYY(String aStartDate, String aEndDate) {
		int aStartMonth;
		int aStartYear;
		int aEndMonth;
		int aEndYear;
		
		aStartMonth = Month_From_MMYY(aStartDate);
		aStartYear = Year_From_MMYY(aStartDate);
		aEndMonth = Month_From_MMYY(aEndDate);
		aEndYear = Year_From_MMYY(aEndDate);
		
		if(aStartMonth == 0 || aStartYear == 0 || aEndMonth == 0 || aEndYear == 0)
			return false;
			
		if (aStartYear < aEndYear)
			return true;

		if (aStartYear > aEndYear)
			return false;

		if (aStartMonth > aEndMonth)
			return false;
			
		return true;
	}

/*----------------------------------------------------*/
//this function randomly re-orders items in any object that implements the IEnumberable
	public static IEnumerable RandomizeCollection (IEnumerable aCollection) {
		ArrayList aRandList = new ArrayList();
		Random aRand = new Random();
		
		foreach (Object aObject in aCollection){
			aRandList.Insert(aRand.Next(0, aRandList.Count + 1), aObject);
		}
			
		return aRandList;
	}

/*----------------------------------------------------*/
//this function orders values in a Hashtable
	public static ArrayList OrderHashtableValues (Hashtable aHashtable) {
		ArrayList aList = new ArrayList();
		
		foreach (Object aValue in aHashtable.Values){
			aList.Add(aValue);
		}
		
		aList.Sort();
			
		return aList;
	}

/*----------------------------------------------------*/
//This function returns a the key of a dictionary item given the item's value
	public static String GetDictionaryKey(IDictionary aDictionary, String aValue) {
		foreach (Object aKey in aDictionary.Keys) {
			if(aValue == aDictionary[aKey].ToString())
				return aKey.ToString();
		}
		return null;
	}
	
/*----------------------------------------------------*/

	public static bool StringToBool(String aValue) {
		if(aValue == "True")
			return true;
		return false;
	}
/*====================================================*/
} //class cLib


}  //Core.Util
