import xml.etree.ElementTree as ET

def parse_dtsx(file_path):
    tree = ET.parse(file_path)
    root = tree.getroot()

    # Namespaces used in SSIS dtsx files
    namespaces = {'d': 'www.microsoft.com/SqlServer/Dts'}

    # Extract tasks
    tasks = []
    for task in root.findall('.//d:Executable', namespaces):
        tasks.append(task.attrib)

    # Extract parameters
    parameters = []
    for param in root.findall('.//d:Parameter', namespaces):
        parameters.append(param.attrib)

    # Extract property nodes
    properties = []
    for prop in root.findall('.//d:Property', namespaces):
        properties.append(prop.attrib)

    return tasks, parameters, properties

# Example usage
file_path = 'path_to_your_dtsx_file.dtsx'
tasks, parameters, properties = parse_dtsx(file_path)

print("Tasks:", tasks)
print("Parameters:", parameters)
print("Properties:", properties)
