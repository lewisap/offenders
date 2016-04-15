function transform(content, context)
{
  if (xdmp.nodeKind(content.value) == 'document' &&
      content.value.documentFormat == 'JSON') {

      // convert the input document to a mutable object
      var docObj = content.value.toObject();
      var uri = content.uri;
      var url = docObj.ImageURL;

      if (url) {
          var image = xdmp.documentGet(url,{"format" : "binary"}).next().value.root;
          var imageUri = uri + "-image.jpg";
          xdmp.documentInsert(imageUri,
                              image,
                              xdmp.defaultPermissions(),
                              "images");
      }

      content.value = xdmp.unquote(xdmp.quote(docObj));
  }
  return content;
};

exports.transform = transform;
