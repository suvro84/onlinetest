using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RoomTypeMaster
/// </summary>
[Serializable]

public class RoomTypeMaster : ICloneable
{

    public RoomTypeMaster()
    {

        this.IsDataNeedsToSave = false;

        this.DelButtonFlag = false;

    }

    // public int key { get; set; }

    public string RoomType { get; set; }

    public string RoomClassCode { get; set; }

    public string RoomDesc { get; set; }

    public string Generic { get; set; }

    public string Type { get; set; }

    public string Discontinue { get; set; }

    public string ExtraBed { get; set; }

    public string Smoking { get; set; }

    public string AutoUpdateSRP { get; set; }

    public int MaxOccupancy { get; set; }

    public int RoomCnt { get; set; }

    public int DisplayOrder { get; set; }

    public byte[] RoomTypeImage { get; set; }

    //public GDSDescriptionList GDSDescription { get { return _gdsDescription; } set { _gdsDescription = value; } }

    public bool AlreadyAssociated { get; set; }

    public bool Changed { get; set; }

    public byte[] SRPAssoImage { get; set; }

    //Chnages done for ESPE by Cognizanr <19052011><start>

    public byte[] RoomAmenitiesImage { get; set; }

    //Chnages done for ESPE by Cognizanr <19052011><end>

    public byte[] GDSDescImage { get; set; }

    public byte[] DeleteImage { get; set; }

    public int TotRoomsInHotel { get; set; }

    public string SoftHotelInd { get; set; }

    public string InvIndicator { get; set; }

    public string FirstFloorInd { get; set; }

    public int AirlineCloseThreshold { get; set; }

    public int AirlineOpenThreshold { get; set; }

    public string AirlineBookingCD { get; set; }

    public DateTime HotelInvEndDate { get; set; }

    public string RoomTypeIndex { get; set; }

    public string RoomName { get; set; }

    public bool Checked { get; set; }

    public string RoomCategory { get; set; }

    public string RoomTypeEnabled { get; set; }



    //Flag for WebSpe

    public bool IsDataNeedsToSave { get; set; }

    //for visibility of del button

    public bool DelButtonFlag { get; set; }

    //newly added columns

    public string RoomCategoryNew { get; set; }

    public string BedType1 { get; set; }

    public string NoBedType1 { get; set; }

    public string BedType2 { get; set; }

    public string NoBedType2 { get; set; }

    public string Adults { get; set; }

    public string Children { get; set; }

    public string RoomTypeName { get; set; }

    public string TotalHotelInventory { get; set; }

    public object Clone()
    {

        return this.MemberwiseClone();

    }

}

[Serializable]

public class RoomTypeMasterList : List<RoomTypeMaster>
{

    public void AddRange(List<RoomTypeMaster> listData)
    {

        foreach (RoomTypeMaster item in listData)
        {

            this.Add(item);

        }

    }

}

