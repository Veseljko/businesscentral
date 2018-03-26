﻿table 70009203 "O4N GL SN User Access"
{
  // version GLSN10.0


  fields
  {
    field(1;"Permission Level";Option)
    {
      Caption='Permission Level';
      OptionCaption='Read,Update';
      OptionMembers=Read,Update;
    }
    field(2;"User Security ID";Guid)
    {
      Caption='User Security ID';
      NotBlank=true;
      TableRelation=User;
    }
    field(3;"Access Via User Group Code";Code[20])
    {
      Caption='Access Via User Group Code';
      NotBlank=true;
      TableRelation="User Group";
    }
    field(4;"User Name";Code[50])
    {
      CalcFormula=Lookup(User."User Name" WHERE ("User Security ID"=FIELD("User Security ID")));
      Caption='User Name';
      Editable=false;
      FieldClass=FlowField;
    }
    field(5;"User Full Name";Text[80])
    {
      CalcFormula=Lookup(User."Full Name" WHERE ("User Security ID"=FIELD("User Security ID")));
      Caption='User Full Name';
      Editable=false;
      FieldClass=FlowField;
    }
    field(6;"Has Permission";Boolean)
    {
      Caption='Has Permission';
    }
    field(7;"Assign Permission";Boolean)
    {
      Caption='Assign Permission';

      trigger OnValidate();
      begin
        "Updated Via User Group" := false;
      end;
    }
    field(8;"Remove Permission";Boolean)
    {
      Caption='Remove Permission';

      trigger OnValidate();
      begin
        "Updated Via User Group" := false;
      end;
    }
    field(9;"Updated Via User Group";Boolean)
    {
      Caption='Updated Via User Group';
    }
  }

  keys
  {
    key(Key1;"Permission Level","User Security ID")
    {
      Clustered=true;
    }
  }

  fieldgroups
  {
  }
}


