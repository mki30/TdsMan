using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TDSMAN
/// </summary>
public sealed class TDSMAN1
{
    private static string DownloadedFileName = "";
    public static string T_DownloadedFileNameFromTraces
    {
        get
        {
            return DownloadedFileName;
        }
        set
        {
            DownloadedFileName = value;
        }
    }
}