


class Ingredients{
 final String? s1;
 final String? s2;
 final String? s3;
 final String? s4;
 final String? s5;
 final String? s6;
 final String? s7;


  Ingredients({
    this.s1,
    this.s2,
    this.s3,
    this.s4,
    this.s5,
    this.s6,
    this.s7,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json){
    return Ingredients(
      s1: json['1'] ?? '' ,
      s2: json['2'] ?? '' ,
      s3: json['3'] ?? '' ,
      s4: json['4'] ?? '' ,
      s5: json['5'] ?? '',
      s6: json['6'] ?? '',
      s7: json['7'] ?? '',
    );
  }


 Map<String, dynamic> toJson(){
    return {
      '1': this.s1 ,
      '2': this.s2,
      '3': this.s3,
      '4': this.s4,
      '5': this.s5,
      '6': this.s6,
      '7': this.s7,
    };
 }

}