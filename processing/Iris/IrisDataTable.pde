//Author: Haozhu Wang

//this file helps to read in the iris data and represents them
//this is done with the help of UCI iris data and its data set 
//description

class IrisDataTable {
    float[][] iris_numeric;
    String[] column_names;
    String[] iris_class;
    int rowCount;
    int columnCount;
    
    IrisDataTable(String filename) {
      rowCount=0;
      String[] rows = loadStrings(filename);
      column_names=new String[5];
      column_names[0]= "sepal length";
      column_names[1]= "sepal width";
      column_names[2]= "pedal length";
      column_names[3]= "pedal width";
      column_names[4]= "class";
      iris_class=new String[rows.length];
      
      iris_numeric=new float[rows.length][];
      
      //split the iris data set into separate attributes; 
      for(int i = 0; i< rows.length; i++){
       if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
       }
        
       String[] attributes=split(rows[i], ",");
       
       scrubQuotes(attributes);
       columnCount=attributes.length;
       
       iris_numeric[rowCount]=(float[])parseFloat(subset(attributes, 0, columnCount-2)); //save all the numeric attributes 
       iris_class[rowCount]=attributes[columnCount-1].substring(5); //save class info
       rowCount++;
      }
      
      iris_numeric= (float[][])subset(iris_numeric,0,rowCount);
      iris_class=(String[])subset(iris_class,0,rowCount);
    }
    
    //return mean of a class' attribute
    float getClassMean(String Attri_name,String name_class)
    {
      float[] atri_class=getAttribute(Attri_name, name_class);
      if(atri_class.length==0)
      {
        return -Float.MAX_VALUE;
      }
      
      float sum=0;
      for(int i=0; i<atri_class.length; i++){
        sum=sum+ atri_class[i];
      }
      
      return sum/atri_class.length;
    }
    
    float rangeAttriClass(String Attri_name){
      float[] all_class=getAttribute(Attri_name);
      if (all_class.length==0){
        return -Float.MAX_VALUE;
      }
      return range(all_class);
    }
    
    float rangeAttriClass(String Attri_name,String class_name){
      float[] all_class=getAttribute(Attri_name,class_name);
      if (all_class.length==0){
        return -Float.MAX_VALUE;
      }
      return range(all_class);
    }
    
    //get the indicated attribute of given class
    float[] getAttribute(String Attri_name,String name_class)
    {
      float[] num_list=getAttribute(Attri_name);
      if(num_list.length==0){
        return null;
      }
      String[] all_class=getIrisClass();
      
      float[] match_attri= new float[num_list.length];
      
      int counter=0;
      
      for(int i=0; i<num_list.length; i++){
        if(all_class[i].equals(name_class)){
          match_attri[counter]=num_list[i];
          counter++;
        }
      }
      
      if (counter==0){
        println("no class matching found");
        return null;
      }
      
      match_attri=(float [])subset(match_attri,0, counter);
      return match_attri;
    }
    
    //get all numbers of the matched attribute name
    float[] getAttribute(String Attri_name)
    {
      int col_index=-1;
      for(int i=0; i<columnCount-1; i++){
        if (column_names[i].equals(Attri_name)){
          col_index=i;
          break;
        }
      }
      
      if (col_index==-1){
        println("no attribute name found");
        return null;
      }
      else{
        float[] list_attribute=new float[rowCount];
        //get all the numeric data with the stated attribute
        for(int j=0; j<rowCount; j++){
          list_attribute[j]= iris_numeric[j][col_index]; 
        }
        
        return list_attribute;
      }
      
    }
    
    String[] getcolumnName()
    {
      return column_names;
    }
    
    String[] getIrisClass()
    {
      return iris_class;
    }
    
    int getRowCount()
    {
      return rowCount;
    }
    
    int getColumnCount()
    {
      return columnCount;
    }
    
    float min_val(float[] val){
      float min_num=Float.MAX_VALUE;
      for(int i=0; i<val.length; i++){
        if (val[i]<min_num)
          min_num=val[i];
      }
      return min_num;
    }
    
    float max_val(float[] val){
      float max_num=-Float.MAX_VALUE;
      for(int i=0; i<val.length; i++){
        if (val[i]>max_num)
          max_num=val[i];
      }
      return max_num;
    }
    
    float range(float[] val){
      return max_val(val)-min_val(val);
    }
    
    void scrubQuotes(String[] array) {
      for (int i = 0; i < array.length; i++) {
        if (array[i].length() > 2) {
          // remove quotes at start and end, if present
          if (array[i].startsWith("\"") && array[i].endsWith("\"")) {
            array[i] = array[i].substring(1, array[i].length() - 1);
          }
        }
      // make double quotes into single quotes
      array[i] = array[i].replaceAll("\"\"", "\"");
    }
  }
}
