import os
from lxml import etree

xml_path = 'public/data/'
xslt_path = 'local/xslt/dicuil-epistula/'

def transform_xml(input_file, xslt_file, output_file):
    # Parse the XML and XSLT files
    xml_tree = etree.parse(input_file)
    xslt_tree = etree.parse(xslt_file)
    
    # Create an XSLT transform object
    transform = etree.XSLT(xslt_tree)
    
    # Apply the transformation
    html_tree = transform(xml_tree)
    
    # Write the result to an HTML file
    with open(output_file, 'wb') as f:
        f.write(etree.tostring(html_tree, pretty_print=True, encoding='UTF-8', xml_declaration=False))
    
    print(f'Transformation complete.')

def main():
    # Process introduction
    input_file = os.path.join(xml_path, 'dicuil-epistula.xml')
    xslt_file = os.path.join(xslt_path, 'convert-introduction.xsl')       
    output_file = os.path.join(xslt_path, 'introduction.htm')    
    transform_xml(input_file, xslt_file, output_file)

if __name__ == '__main__':
    main()
