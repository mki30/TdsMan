// Decompiled with JetBrains decompiler
// Type: TDSMAN.Classes.PANDetails
// Assembly: TDSMAN, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 952B4D48-0FC3-44A5-A16A-36F971D7C17C
// Assembly location: C:\Program Files (x86)\TDSMAN FY 2014-15(trial)\TDSMAN.exe

using System.ComponentModel;


    public class PANDetails : INotifyPropertyChanged
    {
        private Message enmStatus = Message.Invalid;
        private string strName;
        private string strPANNO;
        private string strStatus;

        [Browsable(false)]
        public Message Message
        {
            get
            {
                return this.enmStatus;
            }
            set
            {
                this.enmStatus = value;
            }
        }

        public string Name
        {
            get
            {
                return this.strName;
            }
            set
            {
                if (!(value != this.strName))
                    return;
                this.strName = value;
                this.OnPropertyChanged(new PropertyChangedEventArgs("Name"));
            }
        }

        public string PAN
        {
            get
            {
                return this.strPANNO;
            }
            set
            {
                if (!(value != this.strPANNO))
                    return;
                this.strPANNO = value;
                this.OnPropertyChanged(new PropertyChangedEventArgs("PAN"));
            }
        }

        public string Status
        {
            get
            {
                return this.strStatus;
            }
            set
            {
                if (!(value != this.strStatus))
                    return;
                this.strStatus = value;
                this.OnPropertyChanged(new PropertyChangedEventArgs("Status"));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(PropertyChangedEventArgs e)
        {
            if (null == this.PropertyChanged)
                return;
            this.PropertyChanged((object)this, e);
        }
    }

