@app.route('/display_video', methods=['GET'])
def display_video():
    args = request.args
    start_ts = max([float(args['start_ts'])-2, 0])
    print(f"Forward ts: {start_ts}")

    return f"""<!DOCTYPE html>
    <html>
    <head>
        <title>Video</title>
    </head>
    <body>
        <div style="text-align:center">
            <button onclick="playPause()">Play/Pause</button>
            <br><br>
            <video id="video1" width="1280" height="720" controls>
                <source src="static/2021首届数字金融前沿学术会议_P1.mp4" type="video/mp4">
            </video>
        </div>
        <script>
            var myVideo = document.getElementById("video1");
            function playPause() {{
                if(myVideo.paused) {{
                    document.getElementById("video1").currentTime = {start_ts};
                    myVideo.play();
                }} else {{
                    myVideo.pause();
                }}
            }}
        </script>
    </body>
    </html>
    """
