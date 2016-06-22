// Decompiled with JetBrains decompiler
// Type: TDSMAN.Classes.ErrorDB`3
// Assembly: TDSMAN, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 952B4D48-0FC3-44A5-A16A-36F971D7C17C
// Assembly location: C:\Program Files (x86)\TDSMAN FY 2014-15(trial)\TDSMAN.exe


    public struct ErrorDB<T1, T2, T3>
    {
        private T1 tKey1;
        private T2 tKey2;
        private T3 tKey3;

        public T1 KEY1
        {
            get
            {
                return this.tKey1;
            }
            set
            {
                this.tKey1 = value;
            }
        }

        public T2 KEY2
        {
            get
            {
                return this.tKey2;
            }
            set
            {
                this.tKey2 = value;
            }
        }

        public T3 KEY3
        {
            get
            {
                return this.tKey3;
            }
            set
            {
                this.tKey3 = value;
            }
        }

        public ErrorDB(T1 t1, T2 t2, T3 t3)
        {
            this.tKey1 = t1;
            this.tKey2 = t2;
            this.tKey3 = t3;
        }
    }

