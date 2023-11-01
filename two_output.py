import gradio as gr

def chat(input_text):
    # Replace this with your own logic to generate responses
    response1 = "Response 1"
    response2 = "Response 2"
    return response1, response2

# Create a Textbox component for input
input_textbox = gr.Textbox(lines=10, placeholder="Enter your message here...")

# Create two Textbox components for the outputs
output_textbox1 = gr.Textbox(label="Response 1")
output_textbox2 = gr.Textbox(label="Response 2")

# Create the interface
iface = gr.Interface(fn=chat, inputs=input_textbox, outputs=[output_textbox1, output_textbox2])

# Launch the interface
iface.launch()
